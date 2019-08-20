(defpackage :cl-telegram-bot
  (:nicknames :telegram-bot :tg-bot)
  (:size 55)
  (:use :closer-common-lisp :cl-arrows :closer-mop :trivial-types)
  (:export
   #:bot
   #:make-bot
   #:access
   #:get-updates
   #:set-webhook
   #:get-webhook-info
   #:$
   #:$*))
