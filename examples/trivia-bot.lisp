(in-package :cl-telegram-bot)

(setf *bot* (make-bot "KEY"))
(let ((channel (lparallel:make-channel)))
  (lparallel:submit-task channel #'(lambda ()
                                     (loop
                                       (fetch-updates *bot*)
                                       (sleep 0.1)))))
(defun send-trivia-question ()
  (let* ((question (-> (dex:get "https://opentdb.com/api.php?amount=1&type=boolean" :want-stream t)
                      (json:decode-json)
                      (second)
                      (getf :results))
           )
         (keyboard (make-inline-keyboard '(((:text "True" :callback--data "True")
                                            (:text "False" :callback--data "False"))))))
    ($ (send-message 133107019 (format nil "~A<br><hr><br>~a"
                                       (cdr (assoc :category question))
                                       (cdr (assoc :question question)) :parse--mode "HTML" :reply--markup keyboard))
        (:parallel t :with-reply (a . #'inline-keyboard-answer))
      (let* ((answer (lparallel:force a))
             (id (tg-id answer))
             (data (tg-data answer)))
        ($ (answer-callback-query id) (:parallel t))
        ($ (send-message 133107019
                         (concatenate 'string
                                      (if (string= data (cdr (assoc :correct--answer question)))
                                          "<b>Correct!</b>"
                                          "You're wrong.") " Play again?") :parse--mode "HTML" :reply--markup keyboard)
            (:with-reply (a . #'inline-keyboard-answer))
          ($* (answer-callback-query (tg-id (lparallel:force a))))
          (if (string= (tg-data (lparallel:force a)) "True")
              (send-trivia-question)
              ($* (send-message 133107019 "Thanks for playing."))))))))

(send-trivia-question)
