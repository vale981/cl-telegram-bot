(defpackage :cl-telegram-bot
  (:nicknames :telegram-bot :tg-bot)
  (:use :closer-common-lisp :cl-arrows :closer-mop :trivial-types)
  (:export
   #:tg-bot
   #:make-tg-bot
   #:access
   #:get-updates
   #:set-webhook
   #:get-webhook-info
   #:$
   #:$*))

(defpackage :cl-telegram-bot.autopoll
  (:nicknames :telegram-autopoll-bot :tg-ap-bot)
  (:use :closer-common-lisp :cl-telegram-bot)
  (:export
   #:tg-autopoll-bot
   #:make-autopoll-bot
   #:$
   #:$*))
