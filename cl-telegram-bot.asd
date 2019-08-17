(asdf:defsystem #:cl-telegram-bot
  :description "Telegram Bot API"
  :author "Rei <https://github.com/sovietspaceship>"
  :license "MIT"
  :depends-on (#:cl-json #:alexandria #:closer-mop #:dexador)
  :serial t
  :components ((:file "package")
               (:file "cl-telegram-bot")
               (:file "API")))
