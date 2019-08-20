(asdf:defsystem #:cl-telegram-bot
  :description "Telegram Bot API"
  :author "Rei <https://github.com/sovietspaceship>"
  :license "MIT"
  :depends-on (#:cl-json #:alexandria #:closer-mop #:dexador #:lparallel #:trivial-types #:cl-arrows)
  :serial t
  :components ((:file "package")
               (:file "API")
               (:file "cl-telegram-bot")))
