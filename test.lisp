(ql:quickload :cl-telegram-bot)
(ql:quickload :access)
(in-package :tg-bot)
(ql:quickload :trivia)

(setf *bot* (make-autopoll-bot "355071287:AAGtP_r2UBbIKJXBWbnwy7HvHadiOEfa4D4"))
(defvar keyb (make-inline-keyboard '(((:text "test" :callback--data 1)))))

;; (let ((keybb (make-inline-keyboard '(((:text "test" :callback--data 1)
;;                                       (:text "tust" :callback--data 2))
;;                                      ((:text "Home" :url "https://protagon.space"))))))
;;   ($ (send-message 133107019 "ho" :reply--markup keybb)
;;       (:parallel t :with-reply (a . #'inline-keyboard-answer))
;;     (let* ((answer (lparallel:force a))
;;            (id (tg-id answer))
;;            (data (tg-data answer)))
;;       ($* (answer-callback-query id :text (tg-data answer)))
;;       ($* (send-message 133107019 (format nil "You answered: ~A" data))))))


($ (send-message 133107019 "hi") (:parallel nil))

(defun send-trivia-question (&optional (score 0) (total 1))
  (let* ((question (getf
                    (second
                     (json:decode-json
                      (dex:get "https://opentdb.com/api.php?amount=1&type=boolean" :want-stream t))) :results))
         (keyboard (make-inline-keyboard '(((:text "✅" :callback--data "True")
                                            (:text "❎" :callback--data "False"))))))

    (trivia:match question
      ((alist (:question . question)
              (:category . category)
              (:difficulty . diff)
              (:correct--answer . correct-answer))
       ($ (send-message 133107019 (format nil "<b>~A (~A)</b>~%~a~%<pre>Score: ~A/~A</pre>"
                                          category diff question score total)
                        :parse--mode "HTML" :reply--markup keyboard)
           (:parallel t :with-reply (a . #'inline-keyboard-answer))
         (let* ((answer (lparallel:force a))
                (id (tg-id answer))
                (data (tg-data answer)))
           ($ (answer-callback-query id) (:parallel t))
           ($ (send-message 133107019
                            (concatenate 'string
                                         (if (string= data correct-answer)
                                             (progn (incf score)
                                                    "Correct!")
                                             "You're wrong.") " Play again?") :reply--markup keyboard)
               (:with-reply (a . #'inline-keyboard-answer))
             ($* (answer-callback-query (tg-id (lparallel:force a))))
             (if (string= (tg-data (lparallel:force a)) "True")
                 (send-trivia-question score (1+ total))
                 ($* (send-message 133107019 (format nil "Thanks for playing.~%Your score is: <b>~A/~A</b>" score total)
                                   :parse--mode "HTML"))))))))))
