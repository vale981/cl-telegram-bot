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

(defclass tg-autopoll-bot (tg-bot)
  ((poll-timeout
    :documentation "The poll timeout for long polling. Should be greater than one."
    :initform 10
    :type float
    :initarg poll-timeout
    :accessor poll-timeout)
   (poll-thread
    :documentation "The the lparallel for the polling."
    :reader poll-thread
    :initform nil)
   (break-poll
    :documentation "BT lock to stop polling gracefully."
    :initform nil))
  (:documentation "A telegram bot with automatic threaded long polling via LPARALLEL."))

(defun make-autopoll-bot (token)
  "Create a new bot instance. Takes a token string."
  (make-instance 'tg-autopoll-bot :token token))

(defgeneric start-polling (bot)
  (:documentation "Starts the polling of the telegram bot api. Returns the poll thrad."))

(defmethod start-polling :before (bot)
  (log:info "Starting the polling."))

(defmethod start-polling ((bot tg-autopoll-bot))
  (with-slots (poll-thread poll-timeout break-poll) bot
    (if (and (not break-poll) poll-thread (bt:thread-alive-p poll-thread)) t
        (progn
          (setf break-poll nil)
          (setf poll-thread
                (bt:make-thread
                 (lambda ()
                   (poll-loop bot))
                 :name "TG-BOT-POLL-THREAD"))))))

(defun poll-loop (bot)
  (with-slots (break-poll stop-lock poll-timeout) bot
    (loop while (not break-poll) do
      (log:debug "Polling...")
      (fetch-updates bot :timeout poll-timeout))
    (setf break-poll nil)
    (log:info "Stopped polling.")))

(defgeneric stop-polling (bot)
  (:documentation "Stops the long polling."))

(defmethod stop-polling :before (bot)
  (log:info "Stopping the polling."))

(defmethod stop-polling ((bot tg-autopoll-bot))
  (with-slots (break-poll poll-thread stop-lock) bot
    (if (bt:thread-alive-p poll-thread)
        (progn (setf break-poll t)
               (bt:join-thread poll-thread)
               t)
        nil)))
