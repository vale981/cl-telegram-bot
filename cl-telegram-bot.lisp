;; cl-telegram-bot
;;
;; MIT License
;;
;; Copyright (c) 2016 Rei <https://github.com/sovietspaceship>
;; Copyright (c) 2019 Hiro98 <https://protagon.space>
;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.


(in-package :cl-telegram-bot)

(alexandria:define-constant +http-ok+ 200 :test #'=)
(defvar *bot* nil)
(alexandria:define-constant +return-var+ '*)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;      Basic BOT Implementation       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defclass tg-bot ()
  ((id
    :documentation "Update id"
    :initform 0
    :accessor id)
   (token
    :initarg :token
    :documentation "Bot token given by BotFather"
    :accessor token
    :initform nil)
   (api-uri
    :initarg  :api-uri
    :initform "https://api.telegram.org/"
    :accessor api-uri)
   (endpoint
    :initarg :endpoint
    :accessor endpoint
    :documentation "HTTPS endpoint")
   (file-endpoint
    :initarg :file-endpoint
    :accessor file-endpoint
    :documentation "HTTPS file-endpoint"
    :initform nil)
   (update-hooks
    :documentation "A list of functions to call after retrieving
    updates by FETCH-UPDATES."
    :type (proper-list function)
    :initform nil)
   (reply-queue
    :type (proper-list function)
    :documentation "A queue for storing reply matchers."
    :initform nil))
  (:documentation "The TG-BOT type is just a basic data container to
  hold various transactional data. It does not feature polling or any
  other advanced features. Only the TOKEN initarg is required."))

(defmethod initialize-instance :after ((object tg-bot) &key &allow-other-keys)
  (with-accessors ((token         token)
                   (endpoint      endpoint)
                   (file-endpoint file-endpoint)
                   (api-uri       api-uri)) object
    (setf endpoint      (concatenate 'string api-uri "bot" token "/")
          file-endpoint (concatenate 'string api-uri "file/" "bot" token "/"))))

(define-condition reply-matcher-timeout-error (error)
  ()
  (:documentation "Gets signalled if a reply doesn't arive in time."))

(defgeneric add-reply-matcher (bot matcher result timeout)
  (:documentation "Adds a reply matcher function to BOT that takes an
  object of type *UPDATE and the the result of the api-call RESULT as
  arguments and returns non-nil if the update is the desired
  reply. The reply matcher will be removed after TIMEOUT
  seconds. Returns a PROMISE that resolves to either the return value
  of MATCHER. An condition is signaled on timeout."))

(defmethod add-reply-matcher ((bot tg-bot) matcher result &optional timeout)
  (let ((promise (lparallel:promise)))
    (push `(,promise ,matcher ,result ,(when timeout (+ (get-universal-time) timeout)))
          (slot-value bot 'reply-queue))
    promise))

(defgeneric add-update-hook (bot hook &optional key)
  (:documentation "Adds an update hook that will be called with an
  *UPDATE object on each update, the return value is ignored. Returns
  a keyword to remove that hook."))

(defmethod add-update-hook ((bot tg-bot) hook &optional key)
  (let ((final-key (if key key (gensym))))
    (with-slots (update-hooks) bot
      (when (and key (find key update-hooks :key #'car))
        (error (format nil "Hook with the key \"~a\" already registered." key)))
      (push `(,final-key . ,hook) (slot-value bot 'update-hooks)))
    final-key))

(defgeneric remove-update-hook (bot key)
  (:documentation "Removes an update hook by its key which was
  returned open its registration. Returns t (success) or nil."))

(defmethod remove-update-hook ((bot tg-bot) key)
  (with-slots (update-hooks) bot
    (let ((pos (position key update-hooks :key #'car)))
      (when pos
        (setf update-hooks (nconc (subseq update-hooks 0 pos) (nthcdr (1+ pos) update-hooks))))
      pos)))

(defgeneric process-updates (bot updates)
  (:documentation "Processes the updates fetched by FETCH-UPDATES to detect commands and replies."))

;; check types before
(defmethod process-updates :before (bot updates)
  (declare (type (vector *update) updates)))

(defun read-new-timeout ()
   (format t "Enter a new timeout: ")
   (multiple-value-list (eval (read))))

;; TODO: make slimm with functions
(defmethod process-updates ((bot tg-bot) updates)
  (with-slots (reply-queue update-hooks) bot
    (let ((unresolved nil)) ;; Process reply-matchers
      (loop for update across updates do
        (dolist (matcher-list reply-queue)
          (destructuring-bind (promise matcher result timeout) matcher-list
            (let ((reply (apply matcher (list update result))))
              (if (or (not timeout) (> timeout (get-universal-time)))
                  (if reply
                      (lparallel:fulfill promise reply)
                      (push matcher-list unresolved))
                  (restart-case (error 'reply-matcher-timeout-error)
                    (remove-handler () nil)
                    (reset-timeout (new-timeout)
                      :interactive read-new-timeout
                      (progn
                        (setf (fourth matcher-list) (+ (get-universal-time) new-timeout))
                        (push matcher-list unresolved))))))))
        (dolist (hook update-hooks)     ; process hooks
          (funcall (cdr hook) updates)))
      (setf reply-queue unresolved))))

(defun make-tg-bot (token &optional api-url)
  "Create a new TG-BOT instance. Takes a TOKEN string and optionally an API-URL string."
  (let ((args (if api-url
                  `(:token ,token :api-url api-url)
                  `(:token ,token))))
    (apply #'make-instance `(tg-bot ,@args))))

(defun recursive-change-class (object class)
  "Casts and object and its members into the telegram specific classes."
  (when (and (listp class) (> (length class) 1) (eq (car class) 'array))
    (setf class (second class)))

  (unless (find class *api-types*)
    (return-from recursive-change-class object))

  (when (arrayp object)
    (return-from recursive-change-class
      (map 'vector #'(lambda (value)
                       (recursive-change-class value class))
           object)))

  (change-class object class)
  (dolist (slot (c2mop:class-slots (find-class class)))
    (let* ((name (c2mop:slot-definition-name slot))
           (type (c2mop:slot-definition-type slot)))
      (when (slot-boundp object name)
        (let ((value (slot-value object name)))
          (when value
            (recursive-change-class value type))))))
  object)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;               HELPERS               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun make-request (b name options &key (return-type nil) (timeout 10))
  "Perform HTTP request to NAME API method with OPTIONS JSON-encoded object."
  (let* ((results (multiple-value-list
                   (handler-bind ((dex:http-request-bad-request #'dex:ignore-and-continue))
                     (dex:request
                      (concatenate 'string (endpoint b) name)
                      :method :post
                      :want-stream t
                      :headers '(("Content-Type" . "Application/Json"))
                      :timeout timeout
                      :content (json:encode-json-alist-to-string options)))))
         (message (nth 0 results)))

    (with-slots (ok result description) (decode message)
      (if ok
          (if return-type ; wether to cast into a known custom class or not
              (recursive-change-class result return-type)
              result)
          (error 'request-error :what description)))))

(defun access (update &rest args)
  "Access update field. update.first.second. ... => (access update 'first 'second ...). Nil if unbound."
  (unless update
    (return-from access nil))
  (let ((current update))
    (dolist (r args)
      (unless (slot-boundp current r)
        (return-from access nil))
      (setf current (slot-value current r)))
    current))

(defun get-slot (update slot)
  "Access slot. Since fluid classes signal error on unbound slot access, this instead returns nil."
  (if (slot-boundp update slot)
      (slot-value update slot)
    nil))

(defmacro with-package (package &rest body)
  `(let ((json:*json-symbols-package* ,package)) ,@body))

(defgeneric decode (object))

(defmethod decode ((object stream))
  (let ((json:*json-symbols-package* :cl-telegram-bot))
    (json:with-decoder-simple-clos-semantics
      (prog1
          (json:decode-json object)
        (close object)))))

(defmethod decode ((object string))
  (let ((json:*json-symbols-package* nil))
    (json:with-decoder-simple-clos-semantics
      (with-input-from-string (stream object)
        (json:decode-json stream)))))

(defmethod decode ((object vector))
  (decode (map 'string #'code-char object)))

(define-condition request-error (error)
  ((what :initarg :what :reader what))
  (:report (lambda (condition stream)
             (format stream "Request error: ~A" (what condition)))))

(defmacro find-json-symbol (sym)
  `(find-symbol (symbol-name ,sym) json:*json-symbols-package*))


(defun download-file (b file-id)
  "Get the  path for a  file from a  file-id (see: get-file)  and then
   download it.  Returns nil if the value of the http response code is
   not  success (200);  otherwise it  will returns  three values:  the
   data, the http headers and the exension of the original file"
  (with-package :cl-telegram-bot
                (let* ((file-spec (decode (get-file b file-id))))
                  (with-ok-results (file-spec results)
                                   (alexandria:when-let* ((path      (access results 'file--path))
                                               (uri       (concatenate 'string (file-endpoint b) path))
                                               (extension (cl-ppcre:scan-to-strings "\\..*$" path)))
                                              (multiple-value-bind (body code headers)
                                                  (dex:get uri)
                                                (when (= code +http-ok+)
                                                  (values body headers extension))))))))

;; Telegram API methods, see https://core.telegram.org/bots/api

(defmacro with-ok-results ((unserialized results) &body body)
  `(let ((,results (slot-value ,unserialized (find-json-symbol :result))))
     (if (slot-value ,unserialized (find-json-symbol :ok))
         (progn ,@body)
       nil)))

(defun get-latest-update-id (updates)
  "Finds the latest update id from a sequence of updates."
  (reduce #'max updates :key #'tg-update--id :from-end t))

(defgeneric fetch-updates (bot &key limit timeout)
  (:documentation "Fetches updates from the API. See https://core.telegram.org/bots/api#getupdates."))

(defmethod fetch-updates ((b tg-bot) &key limit (timeout 1))
  (let* ((current-id (id b))
         (results ($ (get-updates
                      :limit limit
                      :timeout timeout
                      :offset current-id)
                      (:bot b :timeout (1+ timeout)))))
    (when (> (length results) 0)
      (let ((id (get-latest-update-id results)))
        (setf (id b) id)
        (incf (id b) 1)))

    (when (> (length results) 0)
      (process-updates b results))
    results))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;        CONVENIENCE INTERFACE        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmacro wrap-$ (&rest body)
  "Wraps all forms following (:INLINE [$|$*] ...) into ([$|$*] ...)$."
  (let* ((index
           (position nil body
                     :test #'(lambda (_ el)
                               (declare (ignore _))
                               (and (listp el) (eq (car el) :inline)
                                  (or (eq (second el) '$*)
                                     (eq (second el) '$)))))))
    (if (and index (< index (1- (length body))))
        `(progn ,@(subseq body 0 index) ,(concatenate 'list (cdr (nth index body)) (subseq body (1+ index))))
        `(progn ,@body))))

(defun make-optional-body (body return-var return-val-sym)
  "Make the body part of the $ (api call macro)."
  (if body
      `(let ((,return-var ,return-val-sym))
         (wrap-$ ,@body))
      return-val-sym))

(defun make-$-method-call (method bot args timeout)
  "Generate a call to MAKE-REQUEST."
  `(apply #'make-request (nconc (list ,bot) (,method ,@args) (list :timeout ,timeout))))

(defmacro $* ((method &rest args) &body body)
  "Call api method with standard BOT and RESULT-VAR. See $."
  `($ (,method ,@args) () ,@body))

(defmacro $ ((method &rest args)
             (&key (bot '*bot*) (return-var +return-var+) (parallel nil) (with-reply nil) (timeout 10))
             &body body)
  "Call an API method. If a body is given the result of the call will be bound to RETURN-VAR and the body will be included. Subsequent calls to $ can be inlined like ($ ... FORMS (:INLINE $ ...) FORMS*) => ($ ... FORMS ($ ... FORMS*))."
  (when (not (find method *api-methods*)) (error "No such API method."))
  (let ((return-val-sym (gensym)))
    `(let* ((,return-val-sym ,(if parallel
                                `(lparallel:future ,(make-$-method-call method bot args timeout))
                                (make-$-method-call method bot args timeout)))
            ,@(when with-reply
                (destructuring-bind (reply-sym matcher &key timeout) with-reply
                  `((,reply-sym
                     ,(if parallel
                          `(lparallel:future
                             (lparallel:force
                              (add-reply-matcher ,bot ,matcher (lparallel:force ,return-val-sym) ,timeout)))
                          `(add-reply-matcher ,bot ,matcher ,return-val-sym ,timeout)))))))
      ,(make-optional-body body return-var return-val-sym))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;         Convenience Wrappers        ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun make-inline-keyboard (keys)
  "Make an inline keyboard markup from an array of arrays of initializer lists of *INLINE-KEYBOARD-BUTTON."
  (declare (type list keys))
  (make-instance
   '*inline-keyboard-markup
   :inline--keyboard (mapcar
                      #'(lambda (keys)
                          (mapcar #'(lambda (key)
                                      (apply #'make-instance `(*inline-keyboard-button ,@key)))
                                  keys))
                      keys)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                        ;            Reply Matchers           ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Reply matchers all take an *UPDATE and an API request answer
;; object.  They return nil if the *UPDATE is not the desired answer
;; or otherwise an arbitrary value that will passed on as reply.

(defun inline-keyboard-answer (update result)
  "A reply matcher to use for inline keyboard messages. Yields a *CALLBACK-QUERY object."
  (when (slot-boundp update 'callback--query)
    (let ((cb (tg-callback--query update)))
      (when (and cb (= (tg-message--id result)
                     (tg-message--id (tg-message cb))))
        cb))))
