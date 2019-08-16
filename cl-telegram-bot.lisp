;; cl-telegram-bot
;;
;; MIT License
;;
;; Copyright (c) 2016 Rei <https://github.com/sovietspaceship>
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

(defclass bot ()
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
    :initform nil)))

(defmethod initialize-instance :after ((object bot) &key &allow-other-keys)
  (with-accessors ((token         token)
                   (endpoint      endpoint)
                   (file-endpoint file-endpoint)
                   (api-uri       api-uri)) object
                   (setf endpoint      (concatenate 'string api-uri "bot" token "/")
                         file-endpoint (concatenate 'string api-uri "file/" "bot" token "/"))))

(defun make-bot (token)
  "Create a new bot instance. Takes a token string."
  (make-instance 'bot :token token))

#+sbcl
(defun get-class-slots (obj)
  "Get a list of class slots, useful to inspect Fluid classes. SBCL only."
  (mapcar #'sb-mop:slot-definition-name
          (sb-mop:class-slots
           (class-of obj))))

(defun recursive-change-class (object top-level-class)
  "Casts and object and its members into the telegram specific classes."
  (when (arrayp object)
    (return-from recursive-change-class
      (map 'vector #'(lambda (value)
                       (recursive-change-class value top-level-class))
           object)))

  (change-class object top-level-class)
  (dolist (slot (c2mop:class-direct-slots (find-class top-level-class)))
    (let* ((name (c2mop:slot-definition-name slot))
           (type (c2mop:slot-definition-type slot)))
      (when (slot-boundp object name)
        (let ((value (slot-value object name)))
          (when (and value (find type *api-types*))
            (recursive-change-class value type))))))
  object)

(defun make-request (b name options &key (streamp nil) (return-type nil))
  "Perform HTTP request to 'name API method with 'options JSON-encoded object."
  (let* ((results (multiple-value-list
                   (drakma:http-request
                    (concatenate 'string (endpoint b) name)
                    :method :post
                    :want-stream streamp
                    :content-type "application/json"
                    :content (json:encode-json-alist-to-string options))))
         (status (cadr results))
         (reason (car (last results)))
         (message (nth 0 results)))
    ;; (when (<= 400 status 599)
    ;;   (error 'request-error :what (format nil "request to ~A returned ~A (~A)" name status reason)))
    (with-slots (ok result description) (decode message)
      (if ok
          (if return-type
              (recursive-change-class result return-type)
              result)
          (error 'request-error :what description)
          ))))

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
  (json:with-decoder-simple-clos-semantics
    (prog1
        (json:decode-json object)
      (close object))))

(defmethod decode ((object string))
  (json:with-decoder-simple-clos-semantics
   (with-input-from-string (stream object)
                           (json:decode-json stream))))

(defmethod decode ((object vector))
  (decode (map 'string #'code-char object)))

(define-condition request-error (error)
  ((what :initarg :what :reader what))
  (:report (lambda (condition stream)
             (format stream "Request error: ~A" (what condition)))))

(defmacro find-json-symbol (sym)
  `(find-symbol (symbol-name ,sym) json:*json-symbols-package*))

(defmacro trace-http ()
  '(setf drakma:*header-stream* *standard-output*))

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
                                                  (drakma:http-request uri :method :get)
                                                (when (= code +http-ok+)
                                                  (values body headers extension))))))))

;; Telegram API methods, see https://core.telegram.org/bots/api

(defmacro with-ok-results ((unserialized results) &body body)
  `(let ((,results (slot-value ,unserialized (find-json-symbol :result))))
     (if (slot-value ,unserialized (find-json-symbol :ok))
         (progn ,@body)
       nil)))

(defun get-updates (b &key limit timeout)
  "https://core.telegram.org/bots/api#getupdates"
  (let* ((current-id (id b))
         (request    (decode (make-request b "getUpdates"
                                           (list (cons :offset current-id)
                                                 (cons :limit limit)
                                                 (cons :timeout timeout))
                                           :streamp t)))
         (results (slot-value request (find-json-symbol :result))))
    (when (eql (slot-value request (find-json-symbol :ok)) nil)
      (error 'request-error :what request))
    (when (> (length results) 0)
      (let* ((last-update (elt results (- (length results) 1)))
             (id (slot-value last-update (find-json-symbol :update--id))))
        (when (= current-id 0)
          (setf (id b) id))
        (incf (id b))))
    results))
