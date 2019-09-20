###############
API Reference
###############

Basic Types, Methods and Functions
==================================

.. cl:package:: cl-telegram-bot
.. cl:type:: TG-BOT
.. cl:function:: MAKE-TG-BOT

   For example:

   .. code-block:: common-lisp

      (setf *bot* (make-tg-bot "secret:token" "http://my-test-endpoint"))
