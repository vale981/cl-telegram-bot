; DO NOT EDIT, AUTO GENERATED

(IN-PACKAGE :CL-TELEGRAM-BOT)
(DEFPARAMETER *API-TYPES*
  '(*UPDATE *WEBHOOK-INFO *USER *CHAT *MESSAGE *MESSAGE-ENTITY *PHOTO-SIZE
    *AUDIO *DOCUMENT *VIDEO *ANIMATION *VOICE *VIDEO-NOTE *CONTACT *LOCATION
    *VENUE *POLL-OPTION *POLL *USER-PROFILE-PHOTOS *FILE *REPLY-KEYBOARD-MARKUP
    *KEYBOARD-BUTTON *REPLY-KEYBOARD-REMOVE *INLINE-KEYBOARD-MARKUP
    *INLINE-KEYBOARD-BUTTON *LOGIN-URL *CALLBACK-QUERY *FORCE-REPLY *CHAT-PHOTO
    *CHAT-MEMBER *CHAT-PERMISSIONS *RESPONSE-PARAMETERS *INPUT-MEDIA-PHOTO
    *INPUT-MEDIA-VIDEO *INPUT-MEDIA-ANIMATION *INPUT-MEDIA-AUDIO
    *INPUT-MEDIA-DOCUMENT *STICKER *STICKER-SET *MASK-POSITION *INLINE-QUERY
    *INLINE-QUERY-RESULT-ARTICLE *INLINE-QUERY-RESULT-PHOTO
    *INLINE-QUERY-RESULT-GIF *INLINE-QUERY-RESULT-MPEG-4-*GIF
    *INLINE-QUERY-RESULT-VIDEO *INLINE-QUERY-RESULT-AUDIO
    *INLINE-QUERY-RESULT-VOICE *INLINE-QUERY-RESULT-DOCUMENT
    *INLINE-QUERY-RESULT-LOCATION *INLINE-QUERY-RESULT-VENUE
    *INLINE-QUERY-RESULT-CONTACT *INLINE-QUERY-RESULT-GAME
    *INLINE-QUERY-RESULT-CACHED-PHOTO *INLINE-QUERY-RESULT-CACHED-GIF
    *INLINE-QUERY-RESULT-CACHED-MPEG-4-*GIF *INLINE-QUERY-RESULT-CACHED-STICKER
    *INLINE-QUERY-RESULT-CACHED-DOCUMENT *INLINE-QUERY-RESULT-CACHED-VIDEO
    *INLINE-QUERY-RESULT-CACHED-VOICE *INLINE-QUERY-RESULT-CACHED-AUDIO
    *INPUT-TEXT-MESSAGE-CONTENT *INPUT-LOCATION-MESSAGE-CONTENT
    *INPUT-VENUE-MESSAGE-CONTENT *INPUT-CONTACT-MESSAGE-CONTENT
    *CHOSEN-INLINE-RESULT *PASSPORT-DATA *PASSPORT-FILE
    *ENCRYPTED-PASSPORT-ELEMENT *ENCRYPTED-CREDENTIALS
    *PASSPORT-ELEMENT-ERROR-DATA-FIELD *PASSPORT-ELEMENT-ERROR-FRONT-SIDE
    *PASSPORT-ELEMENT-ERROR-REVERSE-SIDE *PASSPORT-ELEMENT-ERROR-SELFIE
    *PASSPORT-ELEMENT-ERROR-FILE *PASSPORT-ELEMENT-ERROR-FILES
    *PASSPORT-ELEMENT-ERROR-TRANSLATION-FILE
    *PASSPORT-ELEMENT-ERROR-TRANSLATION-FILES
    *PASSPORT-ELEMENT-ERROR-UNSPECIFIED *GAME *GAME-HIGH-SCORE))
(DEFPARAMETER *API-METHODS*
  '(GET-UPDATES SET-WEBHOOK DELETE-WEBHOOK GET-WEBHOOK-INFO GET-ME SEND-MESSAGE
    FORWARD-MESSAGE SEND-PHOTO SEND-AUDIO SEND-DOCUMENT SEND-VIDEO
    SEND-ANIMATION SEND-VOICE SEND-VIDEO-NOTE SEND-MEDIA-GROUP SEND-LOCATION
    EDIT-MESSAGE-LIVE-LOCATION STOP-MESSAGE-LIVE-LOCATION SEND-VENUE
    SEND-CONTACT SEND-POLL SEND-CHAT-ACTION GET-USER-PROFILE-PHOTOS GET-FILE
    KICK-CHAT-MEMBER UNBAN-CHAT-MEMBER RESTRICT-CHAT-MEMBER PROMOTE-CHAT-MEMBER
    SET-CHAT-PERMISSIONS EXPORT-CHAT-INVITE-LINK SET-CHAT-PHOTO
    DELETE-CHAT-PHOTO SET-CHAT-TITLE SET-CHAT-DESCRIPTION PIN-CHAT-MESSAGE
    UNPIN-CHAT-MESSAGE LEAVE-CHAT GET-CHAT GET-CHAT-ADMINISTRATORS
    GET-CHAT-MEMBERS-COUNT GET-CHAT-MEMBER SET-CHAT-STICKER-SET
    DELETE-CHAT-STICKER-SET ANSWER-CALLBACK-QUERY EDIT-MESSAGE-TEXT
    EDIT-MESSAGE-CAPTION EDIT-MESSAGE-MEDIA EDIT-MESSAGE-REPLY-MARKUP STOP-POLL
    DELETE-MESSAGE SEND-STICKER GET-STICKER-SET UPLOAD-STICKER-FILE
    CREATE-NEW-STICKER-SET ADD-STICKER-TO-SET SET-STICKER-POSITION-IN-SET
    DELETE-STICKER-FROM-SET ANSWER-INLINE-QUERY *INLINE-QUERY-RESULT
    *INPUT-MESSAGE-CONTENT SET-PASSPORT-DATA-ERRORS *PASSPORT-ELEMENT-ERROR
    SEND-GAME SET-GAME-SCORE GET-GAME-HIGH-SCORES))

;----Getting updates----
(DEFCLASS *UPDATE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "Update")
           (UPDATE--ID :INITARG :UPDATE--ID :INITFORM NIL :ACCESSOR
            TG-UPDATE--ID :TYPE INTEGER :DOCUMENTATION
            "The update‘s unique identifier. Update identifiers start from a certain positive number and increase sequentially. This ID becomes especially handy if you’re using Webhooks, since it allows you to ignore repeated updates or to restore the correct update sequence, should they get out of order. If there are no new updates for at least a week, then identifier of the next update will be chosen randomly instead of sequentially.")
           (MESSAGE :INITARG :MESSAGE :ACCESSOR TG-MESSAGE :TYPE *MESSAGE
            :DOCUMENTATION
            "New incoming message of any kind — text, photo, sticker, etc.")
           (EDITED--MESSAGE :INITARG :EDITED--MESSAGE :ACCESSOR
            TG-EDITED--MESSAGE :TYPE *MESSAGE :DOCUMENTATION
            "New version of a message that is known to the bot and was edited")
           (CHANNEL--POST :INITARG :CHANNEL--POST :ACCESSOR TG-CHANNEL--POST
            :TYPE *MESSAGE :DOCUMENTATION
            "New incoming channel post of any kind — text, photo, sticker, etc.")
           (EDITED--CHANNEL--POST :INITARG :EDITED--CHANNEL--POST :ACCESSOR
            TG-EDITED--CHANNEL--POST :TYPE *MESSAGE :DOCUMENTATION
            "New version of a channel post that is known to the bot and was edited")
           (INLINE--QUERY :INITARG :INLINE--QUERY :ACCESSOR TG-INLINE--QUERY
            :TYPE *INLINE-QUERY :DOCUMENTATION "New incoming inline query")
           (CHOSEN--INLINE--RESULT :INITARG :CHOSEN--INLINE--RESULT :ACCESSOR
            TG-CHOSEN--INLINE--RESULT :TYPE *CHOSEN-INLINE-RESULT
            :DOCUMENTATION
            "The result of an inline query that was chosen by a user and sent to their chat partner. Please see our documentation on the feedback collecting for details on how to enable these updates for your bot.")
           (CALLBACK--QUERY :INITARG :CALLBACK--QUERY :ACCESSOR
            TG-CALLBACK--QUERY :TYPE *CALLBACK-QUERY :DOCUMENTATION
            "New incoming callback query")
           (SHIPPING--QUERY :INITARG :SHIPPING--QUERY :ACCESSOR
            TG-SHIPPING--QUERY :TYPE *SHIPPING-QUERY :DOCUMENTATION
            "New incoming shipping query. Only for invoices with flexible price")
           (PRE--CHECKOUT--QUERY :INITARG :PRE--CHECKOUT--QUERY :ACCESSOR
            TG-PRE--CHECKOUT--QUERY :TYPE *PRE-CHECKOUT-QUERY :DOCUMENTATION
            "New incoming pre-checkout query. Contains full information about checkout")
           (POLL :INITARG :POLL :ACCESSOR TG-POLL :TYPE *POLL :DOCUMENTATION
            "New poll state. Bots receive only updates about stopped polls and polls, which are sent by the bot"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#update
This object represents an incoming update.At most one of the optional parameters can be present in any given update."))
(EXPORT '*UPDATE)

(DEFUN GET-UPDATES (&KEY OFFSET LIMIT TIMEOUT ALLOWED--UPDATES)
  "https://core.telegram.org/bots/api#getupdates
Use this method to receive incoming updates using long polling (wiki). An Array of Update objects is returned."
  (LET ((OPTIONS (LIST)))
    (WHEN OFFSET (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :OFFSET OFFSET)))))
    (WHEN LIMIT (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :LIMIT LIMIT)))))
    (WHEN TIMEOUT
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :TIMEOUT TIMEOUT)))))
    (WHEN ALLOWED--UPDATES
      (SETF OPTIONS
              (NCONC OPTIONS (LIST (CONS :ALLOWED_UPDATES ALLOWED--UPDATES)))))
    (LIST "getUpdates" OPTIONS :RETURN-TYPE '*UPDATE)))
(EXPORT 'GET-UPDATES)

(DEFUN SET-WEBHOOK (URL &KEY CERTIFICATE MAX--CONNECTIONS ALLOWED--UPDATES)
  "https://core.telegram.org/bots/api#setwebhook
Use this method to specify a url and receive incoming updates via an outgoing webhook. Whenever there is an update for the bot, we will send an HTTPS POST request to the specified url, containing a JSON-serialized Update. In case of an unsuccessful request, we will give up after a reasonable amount of attempts. Returns True on success."
  (CHECK-TYPE URL STRING)
  (LET ((OPTIONS (LIST (CONS :URL URL))))
    (WHEN CERTIFICATE
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CERTIFICATE CERTIFICATE)))))
    (WHEN MAX--CONNECTIONS
      (SETF OPTIONS
              (NCONC OPTIONS (LIST (CONS :MAX_CONNECTIONS MAX--CONNECTIONS)))))
    (WHEN ALLOWED--UPDATES
      (SETF OPTIONS
              (NCONC OPTIONS (LIST (CONS :ALLOWED_UPDATES ALLOWED--UPDATES)))))
    (LIST "setWebhook" OPTIONS)))
(EXPORT 'SET-WEBHOOK)

(DEFUN DELETE-WEBHOOK ()
  "https://core.telegram.org/bots/api#deletewebhook
Use this method to remove webhook integration if you decide to switch back to getUpdates. Returns True on success. Requires no parameters."
  (LET ((OPTIONS (LIST)))
    (LIST "deleteWebhook" OPTIONS)))
(EXPORT 'DELETE-WEBHOOK)

(DEFUN GET-WEBHOOK-INFO ()
  "https://core.telegram.org/bots/api#getwebhookinfo
Use this method to get current webhook status. Requires no parameters. On success, returns a WebhookInfo object. If the bot is using getUpdates, will return an object with the url field empty."
  (LET ((OPTIONS (LIST)))
    (LIST "getWebhookInfo" OPTIONS :RETURN-TYPE '*WEBHOOK-INFO)))
(EXPORT 'GET-WEBHOOK-INFO)

(DEFCLASS *WEBHOOK-INFO NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "WebhookInfo")
           (URL :INITARG :URL :INITFORM NIL :ACCESSOR TG-URL :TYPE STRING
            :DOCUMENTATION
            "Webhook URL, may be empty if webhook is not set up")
           (HAS--CUSTOM--CERTIFICATE :INITARG :HAS--CUSTOM--CERTIFICATE
            :INITFORM NIL :ACCESSOR TG-HAS--CUSTOM--CERTIFICATE :TYPE BOOLEAN
            :DOCUMENTATION
            "True, if a custom certificate was provided for webhook certificate checks")
           (PENDING--UPDATE--COUNT :INITARG :PENDING--UPDATE--COUNT :INITFORM
            NIL :ACCESSOR TG-PENDING--UPDATE--COUNT :TYPE INTEGER
            :DOCUMENTATION "Number of updates awaiting delivery")
           (LAST--ERROR--DATE :INITARG :LAST--ERROR--DATE :ACCESSOR
            TG-LAST--ERROR--DATE :TYPE INTEGER :DOCUMENTATION
            "Unix time for the most recent error that happened when trying to deliver an update via webhook")
           (LAST--ERROR--MESSAGE :INITARG :LAST--ERROR--MESSAGE :ACCESSOR
            TG-LAST--ERROR--MESSAGE :TYPE STRING :DOCUMENTATION
            "Error message in human-readable format for the most recent error that happened when trying to deliver an update via webhook")
           (MAX--CONNECTIONS :INITARG :MAX--CONNECTIONS :ACCESSOR
            TG-MAX--CONNECTIONS :TYPE INTEGER :DOCUMENTATION
            "Maximum allowed number of simultaneous HTTPS connections to the webhook for update delivery")
           (ALLOWED--UPDATES :INITARG :ALLOWED--UPDATES :ACCESSOR
            TG-ALLOWED--UPDATES :TYPE (ARRAY STRING) :DOCUMENTATION
            "A list of update types the bot is subscribed to. Defaults to all update types"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#webhookinfo
Contains information about the current status of a webhook."))
(EXPORT '*WEBHOOK-INFO)


;----Available types----
(DEFCLASS *USER NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "User")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE INTEGER
            :DOCUMENTATION "Unique identifier for this user or bot")
           (IS--BOT :INITARG :IS--BOT :INITFORM NIL :ACCESSOR TG-IS--BOT :TYPE
            BOOLEAN :DOCUMENTATION "True, if this user is a bot")
           (FIRST--NAME :INITARG :FIRST--NAME :INITFORM NIL :ACCESSOR
            TG-FIRST--NAME :TYPE STRING :DOCUMENTATION
            "User‘s or bot’s first name")
           (LAST--NAME :INITARG :LAST--NAME :ACCESSOR TG-LAST--NAME :TYPE
            STRING :DOCUMENTATION "User‘s or bot’s last name")
           (USERNAME :INITARG :USERNAME :ACCESSOR TG-USERNAME :TYPE STRING
            :DOCUMENTATION "User‘s or bot’s username")
           (LANGUAGE--CODE :INITARG :LANGUAGE--CODE :ACCESSOR TG-LANGUAGE--CODE
            :TYPE STRING :DOCUMENTATION
            "IETF language tag of the user's language"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#user
This object represents a Telegram user or bot."))
(EXPORT '*USER)

(DEFCLASS *CHAT NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "Chat")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE INTEGER
            :DOCUMENTATION
            "Unique identifier for this chat. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION
            "Type of chat, can be either “private”, “group”, “supergroup” or “channel”")
           (TITLE :INITARG :TITLE :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title, for supergroups, channels and group chats")
           (USERNAME :INITARG :USERNAME :ACCESSOR TG-USERNAME :TYPE STRING
            :DOCUMENTATION
            "Username, for private chats, supergroups and channels if available")
           (FIRST--NAME :INITARG :FIRST--NAME :ACCESSOR TG-FIRST--NAME :TYPE
            STRING :DOCUMENTATION
            "First name of the other party in a private chat")
           (LAST--NAME :INITARG :LAST--NAME :ACCESSOR TG-LAST--NAME :TYPE
            STRING :DOCUMENTATION
            "Last name of the other party in a private chat")
           (PHOTO :INITARG :PHOTO :ACCESSOR TG-PHOTO :TYPE *CHAT-PHOTO
            :DOCUMENTATION "Chat photo. Returned only in getChat.")
           (DESCRIPTION :INITARG :DESCRIPTION :ACCESSOR TG-DESCRIPTION :TYPE
            STRING :DOCUMENTATION
            "Description, for groups, supergroups and channel chats. Returned only in getChat.")
           (INVITE--LINK :INITARG :INVITE--LINK :ACCESSOR TG-INVITE--LINK :TYPE
            STRING :DOCUMENTATION
            "Chat invite link, for groups, supergroups and channel chats. Each administrator in a chat generates their own invite links, so the bot must first generate the link using exportChatInviteLink. Returned only in getChat.")
           (PINNED--MESSAGE :INITARG :PINNED--MESSAGE :ACCESSOR
            TG-PINNED--MESSAGE :TYPE *MESSAGE :DOCUMENTATION
            "Pinned message, for groups, supergroups and channels. Returned only in getChat.")
           (PERMISSIONS :INITARG :PERMISSIONS :ACCESSOR TG-PERMISSIONS :TYPE
            *CHAT-PERMISSIONS :DOCUMENTATION
            "Default chat member permissions, for groups and supergroups. Returned only in getChat.")
           (STICKER--SET--NAME :INITARG :STICKER--SET--NAME :ACCESSOR
            TG-STICKER--SET--NAME :TYPE STRING :DOCUMENTATION
            "For supergroups, name of group sticker set. Returned only in getChat.")
           (CAN--SET--STICKER--SET :INITARG :CAN--SET--STICKER--SET :ACCESSOR
            TG-CAN--SET--STICKER--SET :TYPE BOOLEAN :DOCUMENTATION
            "True, if the bot can change the group sticker set. Returned only in getChat."))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#chat
This object represents a chat."))
(EXPORT '*CHAT)

(DEFCLASS *MESSAGE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "Message")
           (MESSAGE--ID :INITARG :MESSAGE--ID :INITFORM NIL :ACCESSOR
            TG-MESSAGE--ID :TYPE INTEGER :DOCUMENTATION
            "Unique message identifier inside this chat")
           (FROM :INITARG :FROM :ACCESSOR TG-FROM :TYPE *USER :DOCUMENTATION
            "Sender, empty for messages sent to channels")
           (DATE :INITARG :DATE :INITFORM NIL :ACCESSOR TG-DATE :TYPE INTEGER
            :DOCUMENTATION "Date the message was sent in Unix time")
           (CHAT :INITARG :CHAT :INITFORM NIL :ACCESSOR TG-CHAT :TYPE *CHAT
            :DOCUMENTATION "Conversation the message belongs to")
           (FORWARD--FROM :INITARG :FORWARD--FROM :ACCESSOR TG-FORWARD--FROM
            :TYPE *USER :DOCUMENTATION
            "For forwarded messages, sender of the original message")
           (FORWARD--FROM--CHAT :INITARG :FORWARD--FROM--CHAT :ACCESSOR
            TG-FORWARD--FROM--CHAT :TYPE *CHAT :DOCUMENTATION
            "For messages forwarded from channels, information about the original channel")
           (FORWARD--FROM--MESSAGE--ID :INITARG :FORWARD--FROM--MESSAGE--ID
            :ACCESSOR TG-FORWARD--FROM--MESSAGE--ID :TYPE INTEGER
            :DOCUMENTATION
            "For messages forwarded from channels, identifier of the original message in the channel")
           (FORWARD--SIGNATURE :INITARG :FORWARD--SIGNATURE :ACCESSOR
            TG-FORWARD--SIGNATURE :TYPE STRING :DOCUMENTATION
            "For messages forwarded from channels, signature of the post author if present")
           (FORWARD--SENDER--NAME :INITARG :FORWARD--SENDER--NAME :ACCESSOR
            TG-FORWARD--SENDER--NAME :TYPE STRING :DOCUMENTATION
            "Sender's name for messages forwarded from users who disallow adding a link to their account in forwarded messages")
           (FORWARD--DATE :INITARG :FORWARD--DATE :ACCESSOR TG-FORWARD--DATE
            :TYPE INTEGER :DOCUMENTATION
            "For forwarded messages, date the original message was sent in Unix time")
           (REPLY--TO--MESSAGE :INITARG :REPLY--TO--MESSAGE :ACCESSOR
            TG-REPLY--TO--MESSAGE :TYPE *MESSAGE :DOCUMENTATION
            "For replies, the original message. Note that the Message object in this field will not contain further reply_to_message fields even if it itself is a reply.")
           (EDIT--DATE :INITARG :EDIT--DATE :ACCESSOR TG-EDIT--DATE :TYPE
            INTEGER :DOCUMENTATION
            "Date the message was last edited in Unix time")
           (MEDIA--GROUP--ID :INITARG :MEDIA--GROUP--ID :ACCESSOR
            TG-MEDIA--GROUP--ID :TYPE STRING :DOCUMENTATION
            "The unique identifier of a media message group this message belongs to")
           (AUTHOR--SIGNATURE :INITARG :AUTHOR--SIGNATURE :ACCESSOR
            TG-AUTHOR--SIGNATURE :TYPE STRING :DOCUMENTATION
            "Signature of the post author for messages in channels")
           (TEXT :INITARG :TEXT :ACCESSOR TG-TEXT :TYPE STRING :DOCUMENTATION
            "For text messages, the actual UTF-8 text of the message, 0-4096 characters.")
           (ENTITIES :INITARG :ENTITIES :ACCESSOR TG-ENTITIES :TYPE
            (ARRAY *MESSAGE-ENTITY) :DOCUMENTATION
            "For text messages, special entities like usernames, URLs, bot commands, etc. that appear in the text")
           (CAPTION--ENTITIES :INITARG :CAPTION--ENTITIES :ACCESSOR
            TG-CAPTION--ENTITIES :TYPE (ARRAY *MESSAGE-ENTITY) :DOCUMENTATION
            "For messages with a caption, special entities like usernames, URLs, bot commands, etc. that appear in the caption")
           (AUDIO :INITARG :AUDIO :ACCESSOR TG-AUDIO :TYPE *AUDIO
            :DOCUMENTATION
            "Message is an audio file, information about the file")
           (DOCUMENT :INITARG :DOCUMENT :ACCESSOR TG-DOCUMENT :TYPE *DOCUMENT
            :DOCUMENTATION
            "Message is a general file, information about the file")
           (ANIMATION :INITARG :ANIMATION :ACCESSOR TG-ANIMATION :TYPE
            *ANIMATION :DOCUMENTATION
            "Message is an animation, information about the animation. For backward compatibility, when this field is set, the document field will also be set")
           (GAME :INITARG :GAME :ACCESSOR TG-GAME :TYPE *GAME :DOCUMENTATION
            "Message is a game, information about the game. More about games »")
           (PHOTO :INITARG :PHOTO :ACCESSOR TG-PHOTO :TYPE (ARRAY *PHOTO-SIZE)
            :DOCUMENTATION "Message is a photo, available sizes of the photo")
           (STICKER :INITARG :STICKER :ACCESSOR TG-STICKER :TYPE *STICKER
            :DOCUMENTATION
            "Message is a sticker, information about the sticker")
           (VIDEO :INITARG :VIDEO :ACCESSOR TG-VIDEO :TYPE *VIDEO
            :DOCUMENTATION "Message is a video, information about the video")
           (VOICE :INITARG :VOICE :ACCESSOR TG-VOICE :TYPE *VOICE
            :DOCUMENTATION
            "Message is a voice message, information about the file")
           (VIDEO--NOTE :INITARG :VIDEO--NOTE :ACCESSOR TG-VIDEO--NOTE :TYPE
            *VIDEO-NOTE :DOCUMENTATION
            "Message is a video note, information about the video message")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption for the animation, audio, document, photo, video or voice, 0-1024 characters")
           (CONTACT :INITARG :CONTACT :ACCESSOR TG-CONTACT :TYPE *CONTACT
            :DOCUMENTATION
            "Message is a shared contact, information about the contact")
           (LOCATION :INITARG :LOCATION :ACCESSOR TG-LOCATION :TYPE *LOCATION
            :DOCUMENTATION
            "Message is a shared location, information about the location")
           (VENUE :INITARG :VENUE :ACCESSOR TG-VENUE :TYPE *VENUE
            :DOCUMENTATION "Message is a venue, information about the venue")
           (POLL :INITARG :POLL :ACCESSOR TG-POLL :TYPE *POLL :DOCUMENTATION
            "Message is a native poll, information about the poll")
           (NEW--CHAT--MEMBERS :INITARG :NEW--CHAT--MEMBERS :ACCESSOR
            TG-NEW--CHAT--MEMBERS :TYPE (ARRAY *USER) :DOCUMENTATION
            "New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)")
           (LEFT--CHAT--MEMBER :INITARG :LEFT--CHAT--MEMBER :ACCESSOR
            TG-LEFT--CHAT--MEMBER :TYPE *USER :DOCUMENTATION
            "A member was removed from the group, information about them (this member may be the bot itself)")
           (NEW--CHAT--TITLE :INITARG :NEW--CHAT--TITLE :ACCESSOR
            TG-NEW--CHAT--TITLE :TYPE STRING :DOCUMENTATION
            "A chat title was changed to this value")
           (NEW--CHAT--PHOTO :INITARG :NEW--CHAT--PHOTO :ACCESSOR
            TG-NEW--CHAT--PHOTO :TYPE (ARRAY *PHOTO-SIZE) :DOCUMENTATION
            "A chat photo was change to this value")
           (DELETE--CHAT--PHOTO :INITARG :DELETE--CHAT--PHOTO :ACCESSOR
            TG-DELETE--CHAT--PHOTO :TYPE NIL :DOCUMENTATION
            "Service message: the chat photo was deleted")
           (GROUP--CHAT--CREATED :INITARG :GROUP--CHAT--CREATED :ACCESSOR
            TG-GROUP--CHAT--CREATED :TYPE NIL :DOCUMENTATION
            "Service message: the group has been created")
           (SUPERGROUP--CHAT--CREATED :INITARG :SUPERGROUP--CHAT--CREATED
            :ACCESSOR TG-SUPERGROUP--CHAT--CREATED :TYPE NIL :DOCUMENTATION
            "Service message: the supergroup has been created. This field can‘t be received in a message coming through updates, because bot can’t be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.")
           (CHANNEL--CHAT--CREATED :INITARG :CHANNEL--CHAT--CREATED :ACCESSOR
            TG-CHANNEL--CHAT--CREATED :TYPE NIL :DOCUMENTATION
            "Service message: the channel has been created. This field can‘t be received in a message coming through updates, because bot can’t be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.")
           (MIGRATE--TO--CHAT--ID :INITARG :MIGRATE--TO--CHAT--ID :ACCESSOR
            TG-MIGRATE--TO--CHAT--ID :TYPE INTEGER :DOCUMENTATION
            "The group has been migrated to a supergroup with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.")
           (MIGRATE--FROM--CHAT--ID :INITARG :MIGRATE--FROM--CHAT--ID :ACCESSOR
            TG-MIGRATE--FROM--CHAT--ID :TYPE INTEGER :DOCUMENTATION
            "The supergroup has been migrated from a group with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.")
           (PINNED--MESSAGE :INITARG :PINNED--MESSAGE :ACCESSOR
            TG-PINNED--MESSAGE :TYPE *MESSAGE :DOCUMENTATION
            "Specified message was pinned. Note that the Message object in this field will not contain further reply_to_message fields even if it is itself a reply.")
           (INVOICE :INITARG :INVOICE :ACCESSOR TG-INVOICE :TYPE *INVOICE
            :DOCUMENTATION
            "Message is an invoice for a payment, information about the invoice. More about payments »")
           (SUCCESSFUL--PAYMENT :INITARG :SUCCESSFUL--PAYMENT :ACCESSOR
            TG-SUCCESSFUL--PAYMENT :TYPE *SUCCESSFUL-PAYMENT :DOCUMENTATION
            "Message is a service message about a successful payment, information about the payment. More about payments »")
           (CONNECTED--WEBSITE :INITARG :CONNECTED--WEBSITE :ACCESSOR
            TG-CONNECTED--WEBSITE :TYPE STRING :DOCUMENTATION
            "The domain name of the website on which the user has logged in. More about Telegram Login »")
           (PASSPORT--DATA :INITARG :PASSPORT--DATA :ACCESSOR TG-PASSPORT--DATA
            :TYPE *PASSPORT-DATA :DOCUMENTATION "Telegram Passport data")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message. login_url buttons are represented as ordinary url buttons."))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#message
This object represents a message."))
(EXPORT '*MESSAGE)

(DEFCLASS *MESSAGE-ENTITY NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "MessageEntity")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION
            "Type of the entity. Can be mention (@username), hashtag, cashtag, bot_command, url, email, phone_number, bold (bold text), italic (italic text), code (monowidth string), pre (monowidth block), text_link (for clickable text URLs), text_mention (for users without usernames)")
           (OFFSET :INITARG :OFFSET :INITFORM NIL :ACCESSOR TG-OFFSET :TYPE
            INTEGER :DOCUMENTATION
            "Offset in UTF-16 code units to the start of the entity")
           (LENGTH :INITARG :LENGTH :INITFORM NIL :ACCESSOR TG-LENGTH :TYPE
                   INTEGER :DOCUMENTATION
                   "Length of the entity in UTF-16 code units")
           (URL :INITARG :URL :ACCESSOR TG-URL :TYPE STRING :DOCUMENTATION
            "For “text_link” only, url that will be opened after user taps on the text")
           (USER :INITARG :USER :ACCESSOR TG-USER :TYPE *USER :DOCUMENTATION
            "For “text_mention” only, the mentioned user"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#messageentity
This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc."))
(EXPORT '*MESSAGE-ENTITY)

(DEFCLASS *PHOTO-SIZE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "PhotoSize")
           (FILE--ID :INITARG :FILE--ID :INITFORM NIL :ACCESSOR TG-FILE--ID
            :TYPE STRING :DOCUMENTATION "Identifier for this file")
           (WIDTH :INITARG :WIDTH :INITFORM NIL :ACCESSOR TG-WIDTH :TYPE
            INTEGER :DOCUMENTATION "Photo width")
           (HEIGHT :INITARG :HEIGHT :INITFORM NIL :ACCESSOR TG-HEIGHT :TYPE
            INTEGER :DOCUMENTATION "Photo height")
           (FILE--SIZE :INITARG :FILE--SIZE :ACCESSOR TG-FILE--SIZE :TYPE
            INTEGER :DOCUMENTATION "File size"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#photosize
This object represents one size of a photo or a file / sticker thumbnail."))
(EXPORT '*PHOTO-SIZE)

(DEFCLASS *AUDIO NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "Audio")
           (FILE--ID :INITARG :FILE--ID :INITFORM NIL :ACCESSOR TG-FILE--ID
            :TYPE STRING :DOCUMENTATION "Identifier for this file")
           (DURATION :INITARG :DURATION :INITFORM NIL :ACCESSOR TG-DURATION
            :TYPE INTEGER :DOCUMENTATION
            "Duration of the audio in seconds as defined by sender")
           (PERFORMER :INITARG :PERFORMER :ACCESSOR TG-PERFORMER :TYPE STRING
            :DOCUMENTATION
            "Performer of the audio as defined by sender or by audio tags")
           (TITLE :INITARG :TITLE :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION
            "Title of the audio as defined by sender or by audio tags")
           (MIME--TYPE :INITARG :MIME--TYPE :ACCESSOR TG-MIME--TYPE :TYPE
            STRING :DOCUMENTATION "MIME type of the file as defined by sender")
           (FILE--SIZE :INITARG :FILE--SIZE :ACCESSOR TG-FILE--SIZE :TYPE
            INTEGER :DOCUMENTATION "File size")
           (THUMB :INITARG :THUMB :ACCESSOR TG-THUMB :TYPE *PHOTO-SIZE
            :DOCUMENTATION
            "Thumbnail of the album cover to which the music file belongs"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#audio
This object represents an audio file to be treated as music by the Telegram clients."))
(EXPORT '*AUDIO)

(DEFCLASS *DOCUMENT NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "Document")
           (FILE--ID :INITARG :FILE--ID :INITFORM NIL :ACCESSOR TG-FILE--ID
            :TYPE STRING :DOCUMENTATION "Identifier for this file")
           (THUMB :INITARG :THUMB :ACCESSOR TG-THUMB :TYPE *PHOTO-SIZE
            :DOCUMENTATION "Document thumbnail as defined by sender")
           (FILE--NAME :INITARG :FILE--NAME :ACCESSOR TG-FILE--NAME :TYPE
            STRING :DOCUMENTATION "Original filename as defined by sender")
           (MIME--TYPE :INITARG :MIME--TYPE :ACCESSOR TG-MIME--TYPE :TYPE
            STRING :DOCUMENTATION "MIME type of the file as defined by sender")
           (FILE--SIZE :INITARG :FILE--SIZE :ACCESSOR TG-FILE--SIZE :TYPE
            INTEGER :DOCUMENTATION "File size"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#document
This object represents a general file (as opposed to photos, voice messages and audio files)."))
(EXPORT '*DOCUMENT)

(DEFCLASS *VIDEO NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "Video")
           (FILE--ID :INITARG :FILE--ID :INITFORM NIL :ACCESSOR TG-FILE--ID
            :TYPE STRING :DOCUMENTATION "Identifier for this file")
           (WIDTH :INITARG :WIDTH :INITFORM NIL :ACCESSOR TG-WIDTH :TYPE
            INTEGER :DOCUMENTATION "Video width as defined by sender")
           (HEIGHT :INITARG :HEIGHT :INITFORM NIL :ACCESSOR TG-HEIGHT :TYPE
            INTEGER :DOCUMENTATION "Video height as defined by sender")
           (DURATION :INITARG :DURATION :INITFORM NIL :ACCESSOR TG-DURATION
            :TYPE INTEGER :DOCUMENTATION
            "Duration of the video in seconds as defined by sender")
           (THUMB :INITARG :THUMB :ACCESSOR TG-THUMB :TYPE *PHOTO-SIZE
            :DOCUMENTATION "Video thumbnail")
           (MIME--TYPE :INITARG :MIME--TYPE :ACCESSOR TG-MIME--TYPE :TYPE
            STRING :DOCUMENTATION "Mime type of a file as defined by sender")
           (FILE--SIZE :INITARG :FILE--SIZE :ACCESSOR TG-FILE--SIZE :TYPE
            INTEGER :DOCUMENTATION "File size"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#video
This object represents a video file."))
(EXPORT '*VIDEO)

(DEFCLASS *ANIMATION NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "Animation")
           (FILE--ID :INITARG :FILE--ID :INITFORM NIL :ACCESSOR TG-FILE--ID
            :TYPE STRING :DOCUMENTATION "Identifier for this file")
           (WIDTH :INITARG :WIDTH :INITFORM NIL :ACCESSOR TG-WIDTH :TYPE
            INTEGER :DOCUMENTATION "Video width as defined by sender")
           (HEIGHT :INITARG :HEIGHT :INITFORM NIL :ACCESSOR TG-HEIGHT :TYPE
            INTEGER :DOCUMENTATION "Video height as defined by sender")
           (DURATION :INITARG :DURATION :INITFORM NIL :ACCESSOR TG-DURATION
            :TYPE INTEGER :DOCUMENTATION
            "Duration of the video in seconds as defined by sender")
           (THUMB :INITARG :THUMB :ACCESSOR TG-THUMB :TYPE *PHOTO-SIZE
            :DOCUMENTATION "Animation thumbnail as defined by sender")
           (FILE--NAME :INITARG :FILE--NAME :ACCESSOR TG-FILE--NAME :TYPE
            STRING :DOCUMENTATION
            "Original animation filename as defined by sender")
           (MIME--TYPE :INITARG :MIME--TYPE :ACCESSOR TG-MIME--TYPE :TYPE
            STRING :DOCUMENTATION "MIME type of the file as defined by sender")
           (FILE--SIZE :INITARG :FILE--SIZE :ACCESSOR TG-FILE--SIZE :TYPE
            INTEGER :DOCUMENTATION "File size"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#animation
This object represents an animation file (GIF or H.264/MPEG-4 AVC video without sound)."))
(EXPORT '*ANIMATION)

(DEFCLASS *VOICE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "Voice")
           (FILE--ID :INITARG :FILE--ID :INITFORM NIL :ACCESSOR TG-FILE--ID
            :TYPE STRING :DOCUMENTATION "Identifier for this file")
           (DURATION :INITARG :DURATION :INITFORM NIL :ACCESSOR TG-DURATION
            :TYPE INTEGER :DOCUMENTATION
            "Duration of the audio in seconds as defined by sender")
           (MIME--TYPE :INITARG :MIME--TYPE :ACCESSOR TG-MIME--TYPE :TYPE
            STRING :DOCUMENTATION "MIME type of the file as defined by sender")
           (FILE--SIZE :INITARG :FILE--SIZE :ACCESSOR TG-FILE--SIZE :TYPE
            INTEGER :DOCUMENTATION "File size"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#voice
This object represents a voice note."))
(EXPORT '*VOICE)

(DEFCLASS *VIDEO-NOTE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "VideoNote")
           (FILE--ID :INITARG :FILE--ID :INITFORM NIL :ACCESSOR TG-FILE--ID
            :TYPE STRING :DOCUMENTATION "Identifier for this file")
           (LENGTH :INITARG :LENGTH :INITFORM NIL :ACCESSOR TG-LENGTH :TYPE
                   INTEGER :DOCUMENTATION
                   "Video width and height (diameter of the video message) as defined by sender")
           (DURATION :INITARG :DURATION :INITFORM NIL :ACCESSOR TG-DURATION
            :TYPE INTEGER :DOCUMENTATION
            "Duration of the video in seconds as defined by sender")
           (THUMB :INITARG :THUMB :ACCESSOR TG-THUMB :TYPE *PHOTO-SIZE
            :DOCUMENTATION "Video thumbnail")
           (FILE--SIZE :INITARG :FILE--SIZE :ACCESSOR TG-FILE--SIZE :TYPE
            INTEGER :DOCUMENTATION "File size"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#videonote
This object represents a video message (available in Telegram apps as of v.4.0)."))
(EXPORT '*VIDEO-NOTE)

(DEFCLASS *CONTACT NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "Contact")
           (PHONE--NUMBER :INITARG :PHONE--NUMBER :INITFORM NIL :ACCESSOR
            TG-PHONE--NUMBER :TYPE STRING :DOCUMENTATION
            "Contact's phone number")
           (FIRST--NAME :INITARG :FIRST--NAME :INITFORM NIL :ACCESSOR
            TG-FIRST--NAME :TYPE STRING :DOCUMENTATION "Contact's first name")
           (LAST--NAME :INITARG :LAST--NAME :ACCESSOR TG-LAST--NAME :TYPE
            STRING :DOCUMENTATION "Contact's last name")
           (USER--ID :INITARG :USER--ID :ACCESSOR TG-USER--ID :TYPE INTEGER
            :DOCUMENTATION "Contact's user identifier in Telegram")
           (VCARD :INITARG :VCARD :ACCESSOR TG-VCARD :TYPE STRING
            :DOCUMENTATION
            "Additional data about the contact in the form of a vCard"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#contact
This object represents a phone contact."))
(EXPORT '*CONTACT)

(DEFCLASS *LOCATION NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "Location")
           (LONGITUDE :INITARG :LONGITUDE :INITFORM NIL :ACCESSOR TG-LONGITUDE
            :TYPE *FLOAT :DOCUMENTATION "Longitude as defined by sender")
           (LATITUDE :INITARG :LATITUDE :INITFORM NIL :ACCESSOR TG-LATITUDE
            :TYPE *FLOAT :DOCUMENTATION "Latitude as defined by sender"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#location
This object represents a point on the map."))
(EXPORT '*LOCATION)

(DEFCLASS *VENUE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "Venue")
           (LOCATION :INITARG :LOCATION :INITFORM NIL :ACCESSOR TG-LOCATION
            :TYPE *LOCATION :DOCUMENTATION "Venue location")
           (TITLE :INITARG :TITLE :INITFORM NIL :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Name of the venue")
           (ADDRESS :INITARG :ADDRESS :INITFORM NIL :ACCESSOR TG-ADDRESS :TYPE
            STRING :DOCUMENTATION "Address of the venue")
           (FOURSQUARE--ID :INITARG :FOURSQUARE--ID :ACCESSOR TG-FOURSQUARE--ID
            :TYPE STRING :DOCUMENTATION "Foursquare identifier of the venue")
           (FOURSQUARE--TYPE :INITARG :FOURSQUARE--TYPE :ACCESSOR
            TG-FOURSQUARE--TYPE :TYPE STRING :DOCUMENTATION
            "Foursquare type of the venue. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#venue
This object represents a venue."))
(EXPORT '*VENUE)

(DEFCLASS *POLL-OPTION NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "PollOption")
           (TEXT :INITARG :TEXT :INITFORM NIL :ACCESSOR TG-TEXT :TYPE STRING
            :DOCUMENTATION "Option text, 1-100 characters")
           (VOTER--COUNT :INITARG :VOTER--COUNT :INITFORM NIL :ACCESSOR
            TG-VOTER--COUNT :TYPE INTEGER :DOCUMENTATION
            "Number of users that voted for this option"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#polloption
This object contains information about one answer option in a poll."))
(EXPORT '*POLL-OPTION)

(DEFCLASS *POLL NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "Poll")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique poll identifier")
           (QUESTION :INITARG :QUESTION :INITFORM NIL :ACCESSOR TG-QUESTION
            :TYPE STRING :DOCUMENTATION "Poll question, 1-255 characters")
           (OPTIONS :INITARG :OPTIONS :INITFORM NIL :ACCESSOR TG-OPTIONS :TYPE
            (ARRAY *POLL-OPTION) :DOCUMENTATION "List of poll options")
           (IS--CLOSED :INITARG :IS--CLOSED :INITFORM NIL :ACCESSOR
            TG-IS--CLOSED :TYPE BOOLEAN :DOCUMENTATION
            "True, if the poll is closed"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#poll
This object contains information about a poll."))
(EXPORT '*POLL)

(DEFCLASS *USER-PROFILE-PHOTOS NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "UserProfilePhotos")
           (TOTAL--COUNT :INITARG :TOTAL--COUNT :INITFORM NIL :ACCESSOR
            TG-TOTAL--COUNT :TYPE INTEGER :DOCUMENTATION
            "Total number of profile pictures the target user has")
           (PHOTOS :INITARG :PHOTOS :INITFORM NIL :ACCESSOR TG-PHOTOS :TYPE
            (ARRAY *PHOTO-SIZE) :DOCUMENTATION
            "Requested profile pictures (in up to 4 sizes each)"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#userprofilephotos
This object represent a user's profile pictures."))
(EXPORT '*USER-PROFILE-PHOTOS)

(DEFCLASS *FILE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "File")
           (FILE--ID :INITARG :FILE--ID :INITFORM NIL :ACCESSOR TG-FILE--ID
            :TYPE STRING :DOCUMENTATION "Identifier for this file")
           (FILE--SIZE :INITARG :FILE--SIZE :ACCESSOR TG-FILE--SIZE :TYPE
            INTEGER :DOCUMENTATION "File size, if known")
           (FILE--PATH :INITARG :FILE--PATH :ACCESSOR TG-FILE--PATH :TYPE
            STRING :DOCUMENTATION
            "File path. Use https://api.telegram.org/file/bot<token>/<file_path> to get the file."))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#file
This object represents a file ready to be downloaded. The file can be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile."))
(EXPORT '*FILE)

(DEFCLASS *REPLY-KEYBOARD-MARKUP NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "ReplyKeyboardMarkup")
           (KEYBOARD :INITARG :KEYBOARD :INITFORM NIL :ACCESSOR TG-KEYBOARD
            :TYPE (ARRAY *KEYBOARD-BUTTON) :DOCUMENTATION
            "Array of button rows, each represented by an Array of KeyboardButton objects")
           (RESIZE--KEYBOARD :INITARG :RESIZE--KEYBOARD :ACCESSOR
            TG-RESIZE--KEYBOARD :TYPE BOOLEAN :DOCUMENTATION
            "Requests clients to resize the keyboard vertically for optimal fit (e.g., make the keyboard smaller if there are just two rows of buttons). Defaults to false, in which case the custom keyboard is always of the same height as the app's standard keyboard.")
           (ONE--TIME--KEYBOARD :INITARG :ONE--TIME--KEYBOARD :ACCESSOR
            TG-ONE--TIME--KEYBOARD :TYPE BOOLEAN :DOCUMENTATION
            "Requests clients to hide the keyboard as soon as it's been used. The keyboard will still be available, but clients will automatically display the usual letter-keyboard in the chat – the user can press a special button in the input field to see the custom keyboard again. Defaults to false.")
           (SELECTIVE :INITARG :SELECTIVE :ACCESSOR TG-SELECTIVE :TYPE BOOLEAN
            :DOCUMENTATION
            "Use this parameter if you want to show the keyboard to specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.Example: A user requests to change the bot‘s language, bot replies to the request with a keyboard to select the new language. Other users in the group don’t see the keyboard."))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#replykeyboardmarkup
This object represents a custom keyboard with reply options (see Introduction to bots for details and examples)."))
(EXPORT '*REPLY-KEYBOARD-MARKUP)

(DEFCLASS *KEYBOARD-BUTTON NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "KeyboardButton")
           (TEXT :INITARG :TEXT :INITFORM NIL :ACCESSOR TG-TEXT :TYPE STRING
            :DOCUMENTATION
            "Text of the button. If none of the optional fields are used, it will be sent as a message when the button is pressed")
           (REQUEST--CONTACT :INITARG :REQUEST--CONTACT :ACCESSOR
            TG-REQUEST--CONTACT :TYPE BOOLEAN :DOCUMENTATION
            "If True, the user's phone number will be sent as a contact when the button is pressed. Available in private chats only")
           (REQUEST--LOCATION :INITARG :REQUEST--LOCATION :ACCESSOR
            TG-REQUEST--LOCATION :TYPE BOOLEAN :DOCUMENTATION
            "If True, the user's current location will be sent when the button is pressed. Available in private chats only"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#keyboardbutton
This object represents one button of the reply keyboard. For simple text buttons String can be used instead of this object to specify text of the button. Optional fields are mutually exclusive."))
(EXPORT '*KEYBOARD-BUTTON)

(DEFCLASS *REPLY-KEYBOARD-REMOVE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "ReplyKeyboardRemove")
           (REMOVE--KEYBOARD :INITARG :REMOVE--KEYBOARD :INITFORM NIL :ACCESSOR
            TG-REMOVE--KEYBOARD :TYPE NIL :DOCUMENTATION
            "Requests clients to remove the custom keyboard (user will not be able to summon this keyboard; if you want to hide the keyboard from sight but keep it accessible, use one_time_keyboard in ReplyKeyboardMarkup)")
           (SELECTIVE :INITARG :SELECTIVE :ACCESSOR TG-SELECTIVE :TYPE BOOLEAN
            :DOCUMENTATION
            "Use this parameter if you want to remove the keyboard for specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message.Example: A user votes in a poll, bot returns confirmation message in reply to the vote and removes the keyboard for that user, while still showing the keyboard with poll options to users who haven't voted yet."))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#replykeyboardremove
Upon receiving a message with this object, Telegram clients will remove the current custom keyboard and display the default letter-keyboard. By default, custom keyboards are displayed until a new keyboard is sent by a bot. An exception is made for one-time keyboards that are hidden immediately after the user presses a button (see ReplyKeyboardMarkup)."))
(EXPORT '*REPLY-KEYBOARD-REMOVE)

(DEFCLASS *INLINE-KEYBOARD-MARKUP NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineKeyboardMarkup")
           (INLINE--KEYBOARD :INITARG :INLINE--KEYBOARD :INITFORM NIL :ACCESSOR
            TG-INLINE--KEYBOARD :TYPE (ARRAY *INLINE-KEYBOARD-BUTTON)
            :DOCUMENTATION
            "Array of button rows, each represented by an Array of InlineKeyboardButton objects"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinekeyboardmarkup
This object represents an inline keyboard that appears right next to the message it belongs to."))
(EXPORT '*INLINE-KEYBOARD-MARKUP)

(DEFCLASS *INLINE-KEYBOARD-BUTTON NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineKeyboardButton")
           (TEXT :INITARG :TEXT :INITFORM NIL :ACCESSOR TG-TEXT :TYPE STRING
            :DOCUMENTATION "Label text on the button")
           (URL :INITARG :URL :ACCESSOR TG-URL :TYPE STRING :DOCUMENTATION
            "HTTP or tg:// url to be opened when button is pressed")
           (LOGIN--URL :INITARG :LOGIN--URL :ACCESSOR TG-LOGIN--URL :TYPE
            *LOGIN-URL :DOCUMENTATION
            "An HTTP URL used to automatically authorize the user. Can be used as a replacement for the Telegram Login Widget.")
           (CALLBACK--DATA :INITARG :CALLBACK--DATA :ACCESSOR TG-CALLBACK--DATA
            :TYPE STRING :DOCUMENTATION
            "Data to be sent in a callback query to the bot when button is pressed, 1-64 bytes")
           (SWITCH--INLINE--QUERY :INITARG :SWITCH--INLINE--QUERY :ACCESSOR
            TG-SWITCH--INLINE--QUERY :TYPE STRING :DOCUMENTATION
            "If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot‘s username and the specified inline query in the input field. Can be empty, in which case just the bot’s username will be inserted.Note: This offers an easy way for users to start using your bot in inline mode when they are currently in a private chat with it. Especially useful when combined with switch_pm… actions – in this case the user will be automatically returned to the chat they switched from, skipping the chat selection screen.")
           (SWITCH--INLINE--QUERY--CURRENT--CHAT :INITARG
            :SWITCH--INLINE--QUERY--CURRENT--CHAT :ACCESSOR
            TG-SWITCH--INLINE--QUERY--CURRENT--CHAT :TYPE STRING :DOCUMENTATION
            "If set, pressing the button will insert the bot‘s username and the specified inline query in the current chat's input field. Can be empty, in which case only the bot’s username will be inserted.This offers a quick way for the user to open your bot in inline mode in the same chat – good for selecting something from multiple options.")
           (CALLBACK--GAME :INITARG :CALLBACK--GAME :ACCESSOR TG-CALLBACK--GAME
            :TYPE *CALLBACK-GAME :DOCUMENTATION
            "Description of the game that will be launched when the user presses the button.NOTE: This type of button must always be the first button in the first row.")
           (PAY :INITARG :PAY :ACCESSOR TG-PAY :TYPE BOOLEAN :DOCUMENTATION
            "Specify True, to send a Pay button.NOTE: This type of button must always be the first button in the first row."))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinekeyboardbutton
This object represents one button of an inline keyboard. You must use exactly one of the optional fields."))
(EXPORT '*INLINE-KEYBOARD-BUTTON)

(DEFCLASS *LOGIN-URL NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "LoginUrl")
           (URL :INITARG :URL :INITFORM NIL :ACCESSOR TG-URL :TYPE STRING
            :DOCUMENTATION
            "An HTTP URL to be opened with user authorization data added to the query string when the button is pressed. If the user refuses to provide authorization data, the original URL without information about the user will be opened. The data added is the same as described in Receiving authorization data.NOTE: You must always check the hash of the received data to verify the authentication and the integrity of the data as described in Checking authorization.")
           (FORWARD--TEXT :INITARG :FORWARD--TEXT :ACCESSOR TG-FORWARD--TEXT
            :TYPE STRING :DOCUMENTATION
            "New text of the button in forwarded messages.")
           (BOT--USERNAME :INITARG :BOT--USERNAME :ACCESSOR TG-BOT--USERNAME
            :TYPE STRING :DOCUMENTATION
            "Username of a bot, which will be used for user authorization. See Setting up a bot for more details. If not specified, the current bot's username will be assumed. The url's domain must be the same as the domain linked with the bot. See Linking your domain to the bot for more details.")
           (REQUEST--WRITE--ACCESS :INITARG :REQUEST--WRITE--ACCESS :ACCESSOR
            TG-REQUEST--WRITE--ACCESS :TYPE BOOLEAN :DOCUMENTATION
            "Pass True to request the permission for your bot to send messages to the user."))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#loginurl
This object represents a parameter of the inline keyboard button used to automatically authorize a user. Serves as a great replacement for the Telegram Login Widget when the user is coming from Telegram. All the user needs to do is tap/click a button and confirm that they want to log in:"))
(EXPORT '*LOGIN-URL)

(DEFCLASS *CALLBACK-QUERY NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "CallbackQuery")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this query")
           (FROM :INITARG :FROM :INITFORM NIL :ACCESSOR TG-FROM :TYPE *USER
            :DOCUMENTATION "Sender")
           (MESSAGE :INITARG :MESSAGE :ACCESSOR TG-MESSAGE :TYPE *MESSAGE
            :DOCUMENTATION
            "Message with the callback button that originated the query. Note that message content and message date will not be available if the message is too old")
           (INLINE--MESSAGE--ID :INITARG :INLINE--MESSAGE--ID :ACCESSOR
            TG-INLINE--MESSAGE--ID :TYPE STRING :DOCUMENTATION
            "Identifier of the message sent via the bot in inline mode, that originated the query.")
           (CHAT--INSTANCE :INITARG :CHAT--INSTANCE :INITFORM NIL :ACCESSOR
            TG-CHAT--INSTANCE :TYPE STRING :DOCUMENTATION
            "Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent. Useful for high scores in games.")
           (DATA :INITARG :DATA :ACCESSOR TG-DATA :TYPE STRING :DOCUMENTATION
            "Data associated with the callback button. Be aware that a bad client can send arbitrary data in this field.")
           (GAME--SHORT--NAME :INITARG :GAME--SHORT--NAME :ACCESSOR
            TG-GAME--SHORT--NAME :TYPE STRING :DOCUMENTATION
            "Short name of a Game to be returned, serves as the unique identifier for the game"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#callbackquery
This object represents an incoming callback query from a callback button in an inline keyboard. If the button that originated the query was attached to a message sent by the bot, the field message will be present. If the button was attached to a message sent via the bot (in inline mode), the field inline_message_id will be present. Exactly one of the fields data or game_short_name will be present."))
(EXPORT '*CALLBACK-QUERY)

(DEFCLASS *FORCE-REPLY NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "ForceReply")
           (FORCE--REPLY :INITARG :FORCE--REPLY :INITFORM NIL :ACCESSOR
            TG-FORCE--REPLY :TYPE NIL :DOCUMENTATION
            "Shows reply interface to the user, as if they manually selected the bot‘s message and tapped ’Reply'")
           (SELECTIVE :INITARG :SELECTIVE :ACCESSOR TG-SELECTIVE :TYPE BOOLEAN
            :DOCUMENTATION
            "Use this parameter if you want to force reply from specific users only. Targets: 1) users that are @mentioned in the text of the Message object; 2) if the bot's message is a reply (has reply_to_message_id), sender of the original message."))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#forcereply
Upon receiving a message with this object, Telegram clients will display a reply interface to the user (act as if the user has selected the bot‘s message and tapped ’Reply'). This can be extremely useful if you want to create user-friendly step-by-step interfaces without having to sacrifice privacy mode."))
(EXPORT '*FORCE-REPLY)

(DEFCLASS *CHAT-PHOTO NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "ChatPhoto")
           (SMALL--FILE--ID :INITARG :SMALL--FILE--ID :INITFORM NIL :ACCESSOR
            TG-SMALL--FILE--ID :TYPE STRING :DOCUMENTATION
            "File identifier of small (160x160) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed.")
           (BIG--FILE--ID :INITARG :BIG--FILE--ID :INITFORM NIL :ACCESSOR
            TG-BIG--FILE--ID :TYPE STRING :DOCUMENTATION
            "File identifier of big (640x640) chat photo. This file_id can be used only for photo download and only for as long as the photo is not changed."))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#chatphoto
This object represents a chat photo."))
(EXPORT '*CHAT-PHOTO)

(DEFCLASS *CHAT-MEMBER NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "ChatMember")
           (USER :INITARG :USER :INITFORM NIL :ACCESSOR TG-USER :TYPE *USER
            :DOCUMENTATION "Information about the user")
           (STATUS :INITARG :STATUS :INITFORM NIL :ACCESSOR TG-STATUS :TYPE
            STRING :DOCUMENTATION
            "The member's status in the chat. Can be “creator”, “administrator”, “member”, “restricted”, “left” or “kicked”")
           (UNTIL--DATE :INITARG :UNTIL--DATE :ACCESSOR TG-UNTIL--DATE :TYPE
            INTEGER :DOCUMENTATION
            "Restricted and kicked only. Date when restrictions will be lifted for this user; unix time")
           (CAN--BE--EDITED :INITARG :CAN--BE--EDITED :ACCESSOR
            TG-CAN--BE--EDITED :TYPE BOOLEAN :DOCUMENTATION
            "Administrators only. True, if the bot is allowed to edit administrator privileges of that user")
           (CAN--POST--MESSAGES :INITARG :CAN--POST--MESSAGES :ACCESSOR
            TG-CAN--POST--MESSAGES :TYPE BOOLEAN :DOCUMENTATION
            "Administrators only. True, if the administrator can post in the channel; channels only")
           (CAN--EDIT--MESSAGES :INITARG :CAN--EDIT--MESSAGES :ACCESSOR
            TG-CAN--EDIT--MESSAGES :TYPE BOOLEAN :DOCUMENTATION
            "Administrators only. True, if the administrator can edit messages of other users and can pin messages; channels only")
           (CAN--DELETE--MESSAGES :INITARG :CAN--DELETE--MESSAGES :ACCESSOR
            TG-CAN--DELETE--MESSAGES :TYPE BOOLEAN :DOCUMENTATION
            "Administrators only. True, if the administrator can delete messages of other users")
           (CAN--RESTRICT--MEMBERS :INITARG :CAN--RESTRICT--MEMBERS :ACCESSOR
            TG-CAN--RESTRICT--MEMBERS :TYPE BOOLEAN :DOCUMENTATION
            "Administrators only. True, if the administrator can restrict, ban or unban chat members")
           (CAN--PROMOTE--MEMBERS :INITARG :CAN--PROMOTE--MEMBERS :ACCESSOR
            TG-CAN--PROMOTE--MEMBERS :TYPE BOOLEAN :DOCUMENTATION
            "Administrators only. True, if the administrator can add new administrators with a subset of his own privileges or demote administrators that he has promoted, directly or indirectly (promoted by administrators that were appointed by the user)")
           (CAN--CHANGE--INFO :INITARG :CAN--CHANGE--INFO :ACCESSOR
            TG-CAN--CHANGE--INFO :TYPE BOOLEAN :DOCUMENTATION
            "Administrators and restricted only. True, if the user is allowed to change the chat title, photo and other settings")
           (CAN--INVITE--USERS :INITARG :CAN--INVITE--USERS :ACCESSOR
            TG-CAN--INVITE--USERS :TYPE BOOLEAN :DOCUMENTATION
            "Administrators and restricted only. True, if the user is allowed to invite new users to the chat")
           (CAN--PIN--MESSAGES :INITARG :CAN--PIN--MESSAGES :ACCESSOR
            TG-CAN--PIN--MESSAGES :TYPE BOOLEAN :DOCUMENTATION
            "Administrators and restricted only. True, if the user is allowed to pin messages; groups and supergroups only")
           (IS--MEMBER :INITARG :IS--MEMBER :ACCESSOR TG-IS--MEMBER :TYPE
            BOOLEAN :DOCUMENTATION
            "Restricted only. True, if the user is a member of the chat at the moment of the request")
           (CAN--SEND--MESSAGES :INITARG :CAN--SEND--MESSAGES :ACCESSOR
            TG-CAN--SEND--MESSAGES :TYPE BOOLEAN :DOCUMENTATION
            "Restricted only. True, if the user is allowed to send text messages, contacts, locations and venues")
           (CAN--SEND--MEDIA--MESSAGES :INITARG :CAN--SEND--MEDIA--MESSAGES
            :ACCESSOR TG-CAN--SEND--MEDIA--MESSAGES :TYPE BOOLEAN
            :DOCUMENTATION
            "Restricted only. True, if the user is allowed to send audios, documents, photos, videos, video notes and voice notes")
           (CAN--SEND--POLLS :INITARG :CAN--SEND--POLLS :ACCESSOR
            TG-CAN--SEND--POLLS :TYPE BOOLEAN :DOCUMENTATION
            "Restricted only. True, if the user is allowed to send polls")
           (CAN--SEND--OTHER--MESSAGES :INITARG :CAN--SEND--OTHER--MESSAGES
            :ACCESSOR TG-CAN--SEND--OTHER--MESSAGES :TYPE BOOLEAN
            :DOCUMENTATION
            "Restricted only. True, if the user is allowed to send animations, games, stickers and use inline bots")
           (CAN--ADD--WEB--PAGE--PREVIEWS :INITARG
            :CAN--ADD--WEB--PAGE--PREVIEWS :ACCESSOR
            TG-CAN--ADD--WEB--PAGE--PREVIEWS :TYPE BOOLEAN :DOCUMENTATION
            "Restricted only. True, if the user is allowed to add web page previews to their messages"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#chatmember
This object contains information about one member of a chat."))
(EXPORT '*CHAT-MEMBER)

(DEFCLASS *CHAT-PERMISSIONS NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "ChatPermissions")
           (CAN--SEND--MESSAGES :INITARG :CAN--SEND--MESSAGES :ACCESSOR
            TG-CAN--SEND--MESSAGES :TYPE BOOLEAN :DOCUMENTATION
            "True, if the user is allowed to send text messages, contacts, locations and venues")
           (CAN--SEND--MEDIA--MESSAGES :INITARG :CAN--SEND--MEDIA--MESSAGES
            :ACCESSOR TG-CAN--SEND--MEDIA--MESSAGES :TYPE BOOLEAN
            :DOCUMENTATION
            "True, if the user is allowed to send audios, documents, photos, videos, video notes and voice notes, implies can_send_messages")
           (CAN--SEND--POLLS :INITARG :CAN--SEND--POLLS :ACCESSOR
            TG-CAN--SEND--POLLS :TYPE BOOLEAN :DOCUMENTATION
            "True, if the user is allowed to send polls, implies can_send_messages")
           (CAN--SEND--OTHER--MESSAGES :INITARG :CAN--SEND--OTHER--MESSAGES
            :ACCESSOR TG-CAN--SEND--OTHER--MESSAGES :TYPE BOOLEAN
            :DOCUMENTATION
            "True, if the user is allowed to send animations, games, stickers and use inline bots, implies can_send_media_messages")
           (CAN--ADD--WEB--PAGE--PREVIEWS :INITARG
            :CAN--ADD--WEB--PAGE--PREVIEWS :ACCESSOR
            TG-CAN--ADD--WEB--PAGE--PREVIEWS :TYPE BOOLEAN :DOCUMENTATION
            "True, if the user is allowed to add web page previews to their messages, implies can_send_media_messages")
           (CAN--CHANGE--INFO :INITARG :CAN--CHANGE--INFO :ACCESSOR
            TG-CAN--CHANGE--INFO :TYPE BOOLEAN :DOCUMENTATION
            "True, if the user is allowed to change the chat title, photo and other settings. Ignored in public supergroups")
           (CAN--INVITE--USERS :INITARG :CAN--INVITE--USERS :ACCESSOR
            TG-CAN--INVITE--USERS :TYPE BOOLEAN :DOCUMENTATION
            "True, if the user is allowed to invite new users to the chat")
           (CAN--PIN--MESSAGES :INITARG :CAN--PIN--MESSAGES :ACCESSOR
            TG-CAN--PIN--MESSAGES :TYPE BOOLEAN :DOCUMENTATION
            "True, if the user is allowed to pin messages. Ignored in public supergroups"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#chatpermissions
Describes actions that a non-administrator user is allowed to take in a chat."))
(EXPORT '*CHAT-PERMISSIONS)

(DEFCLASS *RESPONSE-PARAMETERS NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "ResponseParameters")
           (MIGRATE--TO--CHAT--ID :INITARG :MIGRATE--TO--CHAT--ID :ACCESSOR
            TG-MIGRATE--TO--CHAT--ID :TYPE INTEGER :DOCUMENTATION
            "The group has been migrated to a supergroup with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.")
           (RETRY--AFTER :INITARG :RETRY--AFTER :ACCESSOR TG-RETRY--AFTER :TYPE
            INTEGER :DOCUMENTATION
            "In case of exceeding flood control, the number of seconds left to wait before the request can be repeated"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#responseparameters
Contains information about why a request was unsuccessful."))
(EXPORT '*RESPONSE-PARAMETERS)

(DEFCLASS *INPUT-MEDIA-PHOTO NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InputMediaPhoto")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be photo")
           (MEDIA :INITARG :MEDIA :INITFORM NIL :ACCESSOR TG-MEDIA :TYPE STRING
            :DOCUMENTATION
            "File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More info on Sending Files »")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the photo to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption."))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#inputmediaphoto
Represents a photo to be sent."))
(EXPORT '*INPUT-MEDIA-PHOTO)

(DEFCLASS *INPUT-MEDIA-VIDEO NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InputMediaVideo")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be video")
           (MEDIA :INITARG :MEDIA :INITFORM NIL :ACCESSOR TG-MEDIA :TYPE STRING
            :DOCUMENTATION
            "File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More info on Sending Files »")
           (THUMB :INITARG :THUMB :ACCESSOR TG-THUMB :TYPE
            (OR *INPUT-FILE STRING) :DOCUMENTATION
            "Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail‘s width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can’t be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More info on Sending Files »")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the video to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (WIDTH :INITARG :WIDTH :ACCESSOR TG-WIDTH :TYPE INTEGER
            :DOCUMENTATION "Video width")
           (HEIGHT :INITARG :HEIGHT :ACCESSOR TG-HEIGHT :TYPE INTEGER
            :DOCUMENTATION "Video height")
           (DURATION :INITARG :DURATION :ACCESSOR TG-DURATION :TYPE INTEGER
            :DOCUMENTATION "Video duration")
           (SUPPORTS--STREAMING :INITARG :SUPPORTS--STREAMING :ACCESSOR
            TG-SUPPORTS--STREAMING :TYPE BOOLEAN :DOCUMENTATION
            "Pass True, if the uploaded video is suitable for streaming"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#inputmediavideo
Represents a video to be sent."))
(EXPORT '*INPUT-MEDIA-VIDEO)

(DEFCLASS *INPUT-MEDIA-ANIMATION NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InputMediaAnimation")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be animation")
           (MEDIA :INITARG :MEDIA :INITFORM NIL :ACCESSOR TG-MEDIA :TYPE STRING
            :DOCUMENTATION
            "File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More info on Sending Files »")
           (THUMB :INITARG :THUMB :ACCESSOR TG-THUMB :TYPE
            (OR *INPUT-FILE STRING) :DOCUMENTATION
            "Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail‘s width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can’t be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More info on Sending Files »")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the animation to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (WIDTH :INITARG :WIDTH :ACCESSOR TG-WIDTH :TYPE INTEGER
            :DOCUMENTATION "Animation width")
           (HEIGHT :INITARG :HEIGHT :ACCESSOR TG-HEIGHT :TYPE INTEGER
            :DOCUMENTATION "Animation height")
           (DURATION :INITARG :DURATION :ACCESSOR TG-DURATION :TYPE INTEGER
            :DOCUMENTATION "Animation duration"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inputmediaanimation
Represents an animation file (GIF or H.264/MPEG-4 AVC video without sound) to be sent."))
(EXPORT '*INPUT-MEDIA-ANIMATION)

(DEFCLASS *INPUT-MEDIA-AUDIO NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InputMediaAudio")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be audio")
           (MEDIA :INITARG :MEDIA :INITFORM NIL :ACCESSOR TG-MEDIA :TYPE STRING
            :DOCUMENTATION
            "File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More info on Sending Files »")
           (THUMB :INITARG :THUMB :ACCESSOR TG-THUMB :TYPE
            (OR *INPUT-FILE STRING) :DOCUMENTATION
            "Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail‘s width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can’t be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More info on Sending Files »")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the audio to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (DURATION :INITARG :DURATION :ACCESSOR TG-DURATION :TYPE INTEGER
            :DOCUMENTATION "Duration of the audio in seconds")
           (PERFORMER :INITARG :PERFORMER :ACCESSOR TG-PERFORMER :TYPE STRING
            :DOCUMENTATION "Performer of the audio")
           (TITLE :INITARG :TITLE :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title of the audio"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#inputmediaaudio
Represents an audio file to be treated as music to be sent."))
(EXPORT '*INPUT-MEDIA-AUDIO)

(DEFCLASS *INPUT-MEDIA-DOCUMENT NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InputMediaDocument")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be document")
           (MEDIA :INITARG :MEDIA :INITFORM NIL :ACCESSOR TG-MEDIA :TYPE STRING
            :DOCUMENTATION
            "File to send. Pass a file_id to send a file that exists on the Telegram servers (recommended), pass an HTTP URL for Telegram to get a file from the Internet, or pass “attach://<file_attach_name>” to upload a new one using multipart/form-data under <file_attach_name> name. More info on Sending Files »")
           (THUMB :INITARG :THUMB :ACCESSOR TG-THUMB :TYPE
            (OR *INPUT-FILE STRING) :DOCUMENTATION
            "Thumbnail of the file sent; can be ignored if thumbnail generation for the file is supported server-side. The thumbnail should be in JPEG format and less than 200 kB in size. A thumbnail‘s width and height should not exceed 320. Ignored if the file is not uploaded using multipart/form-data. Thumbnails can’t be reused and can be only uploaded as a new file, so you can pass “attach://<file_attach_name>” if the thumbnail was uploaded using multipart/form-data under <file_attach_name>. More info on Sending Files »")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the document to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption."))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#inputmediadocument
Represents a general file to be sent."))
(EXPORT '*INPUT-MEDIA-DOCUMENT)


;----Available methods----
(DEFUN GET-ME ()
  "https://core.telegram.org/bots/api#getme
A simple method for testing your bot's auth token. Requires no parameters. Returns basic information about the bot in form of a User object."
  (LET ((OPTIONS (LIST)))
    (LIST "getMe" OPTIONS :RETURN-TYPE '*USER)))
(EXPORT 'GET-ME)

(DEFUN SEND-MESSAGE
       (CHAT--ID TEXT
        &KEY PARSE--MODE DISABLE--WEB--PAGE--PREVIEW DISABLE--NOTIFICATION
        REPLY--TO--MESSAGE--ID REPLY--MARKUP)
  "https://core.telegram.org/bots/api#sendmessage
Use this method to send text messages. On success, the sent Message is returned."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE TEXT STRING)
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :TEXT TEXT))))
    (WHEN PARSE--MODE
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :PARSE_MODE PARSE--MODE)))))
    (WHEN DISABLE--WEB--PAGE--PREVIEW
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_WEB_PAGE_PREVIEW
                            DISABLE--WEB--PAGE--PREVIEW)))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "sendMessage" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-MESSAGE)

(DEFUN FORWARD-MESSAGE
       (CHAT--ID FROM--CHAT--ID MESSAGE--ID &KEY DISABLE--NOTIFICATION)
  "https://core.telegram.org/bots/api#forwardmessage
Use this method to forward messages of any kind. On success, the sent Message is returned."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE FROM--CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE MESSAGE--ID INTEGER)
  (LET ((OPTIONS
         (LIST (CONS :CHAT_ID CHAT--ID) (CONS :FROM_CHAT_ID FROM--CHAT--ID)
               (CONS :MESSAGE_ID MESSAGE--ID))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (LIST "forwardMessage" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'FORWARD-MESSAGE)

(DEFUN SEND-PHOTO
       (CHAT--ID PHOTO
        &KEY CAPTION PARSE--MODE DISABLE--NOTIFICATION REPLY--TO--MESSAGE--ID
        REPLY--MARKUP)
  "https://core.telegram.org/bots/api#sendphoto
Use this method to send photos. On success, the sent Message is returned."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE PHOTO (OR *INPUT-FILE STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :PHOTO PHOTO))))
    (WHEN CAPTION
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CAPTION CAPTION)))))
    (WHEN PARSE--MODE
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :PARSE_MODE PARSE--MODE)))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "sendPhoto" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-PHOTO)

(DEFUN SEND-AUDIO
       (CHAT--ID AUDIO
        &KEY CAPTION PARSE--MODE DURATION PERFORMER TITLE THUMB
        DISABLE--NOTIFICATION REPLY--TO--MESSAGE--ID REPLY--MARKUP)
  "https://core.telegram.org/bots/api#sendaudio
Use this method to send audio files, if you want Telegram clients to display them in the music player. Your audio must be in the .mp3 format. On success, the sent Message is returned. Bots can currently send audio files of up to 50 MB in size, this limit may be changed in the future."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE AUDIO (OR *INPUT-FILE STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :AUDIO AUDIO))))
    (WHEN CAPTION
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CAPTION CAPTION)))))
    (WHEN PARSE--MODE
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :PARSE_MODE PARSE--MODE)))))
    (WHEN DURATION
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :DURATION DURATION)))))
    (WHEN PERFORMER
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :PERFORMER PERFORMER)))))
    (WHEN TITLE (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :TITLE TITLE)))))
    (WHEN THUMB (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :THUMB THUMB)))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "sendAudio" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-AUDIO)

(DEFUN SEND-DOCUMENT
       (CHAT--ID DOCUMENT
        &KEY THUMB CAPTION PARSE--MODE DISABLE--NOTIFICATION
        REPLY--TO--MESSAGE--ID REPLY--MARKUP)
  "https://core.telegram.org/bots/api#senddocument
Use this method to send general files. On success, the sent Message is returned. Bots can currently send files of any type of up to 50 MB in size, this limit may be changed in the future."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE DOCUMENT (OR *INPUT-FILE STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :DOCUMENT DOCUMENT))))
    (WHEN THUMB (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :THUMB THUMB)))))
    (WHEN CAPTION
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CAPTION CAPTION)))))
    (WHEN PARSE--MODE
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :PARSE_MODE PARSE--MODE)))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "sendDocument" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-DOCUMENT)

(DEFUN SEND-VIDEO
       (CHAT--ID VIDEO
        &KEY DURATION WIDTH HEIGHT THUMB CAPTION PARSE--MODE
        SUPPORTS--STREAMING DISABLE--NOTIFICATION REPLY--TO--MESSAGE--ID
        REPLY--MARKUP)
  "https://core.telegram.org/bots/api#sendvideo
Use this method to send video files, Telegram clients support mp4 videos (other formats may be sent as Document). On success, the sent Message is returned. Bots can currently send video files of up to 50 MB in size, this limit may be changed in the future."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE VIDEO (OR *INPUT-FILE STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :VIDEO VIDEO))))
    (WHEN DURATION
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :DURATION DURATION)))))
    (WHEN WIDTH (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :WIDTH WIDTH)))))
    (WHEN HEIGHT (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :HEIGHT HEIGHT)))))
    (WHEN THUMB (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :THUMB THUMB)))))
    (WHEN CAPTION
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CAPTION CAPTION)))))
    (WHEN PARSE--MODE
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :PARSE_MODE PARSE--MODE)))))
    (WHEN SUPPORTS--STREAMING
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST (CONS :SUPPORTS_STREAMING SUPPORTS--STREAMING)))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "sendVideo" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-VIDEO)

(DEFUN SEND-ANIMATION
       (CHAT--ID ANIMATION
        &KEY DURATION WIDTH HEIGHT THUMB CAPTION PARSE--MODE
        DISABLE--NOTIFICATION REPLY--TO--MESSAGE--ID REPLY--MARKUP)
  "https://core.telegram.org/bots/api#sendanimation
Use this method to send animation files (GIF or H.264/MPEG-4 AVC video without sound). On success, the sent Message is returned. Bots can currently send animation files of up to 50 MB in size, this limit may be changed in the future."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE ANIMATION (OR *INPUT-FILE STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :ANIMATION ANIMATION))))
    (WHEN DURATION
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :DURATION DURATION)))))
    (WHEN WIDTH (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :WIDTH WIDTH)))))
    (WHEN HEIGHT (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :HEIGHT HEIGHT)))))
    (WHEN THUMB (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :THUMB THUMB)))))
    (WHEN CAPTION
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CAPTION CAPTION)))))
    (WHEN PARSE--MODE
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :PARSE_MODE PARSE--MODE)))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "sendAnimation" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-ANIMATION)

(DEFUN SEND-VOICE
       (CHAT--ID VOICE
        &KEY CAPTION PARSE--MODE DURATION DISABLE--NOTIFICATION
        REPLY--TO--MESSAGE--ID REPLY--MARKUP)
  "https://core.telegram.org/bots/api#sendvoice
Use this method to send audio files, if you want Telegram clients to display the file as a playable voice message. For this to work, your audio must be in an .ogg file encoded with OPUS (other formats may be sent as Audio or Document). On success, the sent Message is returned. Bots can currently send voice messages of up to 50 MB in size, this limit may be changed in the future."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE VOICE (OR *INPUT-FILE STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :VOICE VOICE))))
    (WHEN CAPTION
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CAPTION CAPTION)))))
    (WHEN PARSE--MODE
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :PARSE_MODE PARSE--MODE)))))
    (WHEN DURATION
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :DURATION DURATION)))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "sendVoice" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-VOICE)

(DEFUN SEND-VIDEO-NOTE
       (CHAT--ID VIDEO--NOTE
        &KEY DURATION LENGTH THUMB DISABLE--NOTIFICATION REPLY--TO--MESSAGE--ID
        REPLY--MARKUP)
  "https://core.telegram.org/bots/api#sendvideonote
As of v.4.0, Telegram clients support rounded square mp4 videos of up to 1 minute long. Use this method to send video messages. On success, the sent Message is returned."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE VIDEO--NOTE (OR *INPUT-FILE STRING))
  (LET ((OPTIONS
         (LIST (CONS :CHAT_ID CHAT--ID) (CONS :VIDEO_NOTE VIDEO--NOTE))))
    (WHEN DURATION
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :DURATION DURATION)))))
    (WHEN LENGTH (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :LENGTH LENGTH)))))
    (WHEN THUMB (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :THUMB THUMB)))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "sendVideoNote" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-VIDEO-NOTE)

(DEFUN SEND-MEDIA-GROUP
       (CHAT--ID MEDIA &KEY DISABLE--NOTIFICATION REPLY--TO--MESSAGE--ID)
  "https://core.telegram.org/bots/api#sendmediagroup
Use this method to send a group of photos or videos as an album. On success, an array of the sent Messages is returned."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE MEDIA (ARRAY (OR *INPUT-MEDIA-PHOTO *INPUT-MEDIA-VIDEO)))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :MEDIA MEDIA))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (LIST "sendMediaGroup" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-MEDIA-GROUP)

(DEFUN SEND-LOCATION
       (CHAT--ID LATITUDE LONGITUDE
        &KEY LIVE--PERIOD DISABLE--NOTIFICATION REPLY--TO--MESSAGE--ID
        REPLY--MARKUP)
  "https://core.telegram.org/bots/api#sendlocation
Use this method to send point on the map. On success, the sent Message is returned."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE LATITUDE FLOAT)
  (CHECK-TYPE LONGITUDE FLOAT)
  (LET ((OPTIONS
         (LIST (CONS :CHAT_ID CHAT--ID) (CONS :LATITUDE LATITUDE)
               (CONS :LONGITUDE LONGITUDE))))
    (WHEN LIVE--PERIOD
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :LIVE_PERIOD LIVE--PERIOD)))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "sendLocation" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-LOCATION)

(DEFUN EDIT-MESSAGE-LIVE-LOCATION
       (LATITUDE LONGITUDE
        &KEY CHAT--ID MESSAGE--ID INLINE--MESSAGE--ID REPLY--MARKUP)
  "https://core.telegram.org/bots/api#editmessagelivelocation
Use this method to edit live location messages. A location can be edited until its live_period expires or editing is explicitly disabled by a call to stopMessageLiveLocation. On success, if the edited message was sent by the bot, the edited Message is returned, otherwise True is returned."
  (CHECK-TYPE LATITUDE FLOAT)
  (CHECK-TYPE LONGITUDE FLOAT)
  (LET ((OPTIONS (LIST (CONS :LATITUDE LATITUDE) (CONS :LONGITUDE LONGITUDE))))
    (WHEN CHAT--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CHAT_ID CHAT--ID)))))
    (WHEN MESSAGE--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :MESSAGE_ID MESSAGE--ID)))))
    (WHEN INLINE--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST (CONS :INLINE_MESSAGE_ID INLINE--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "editMessageLiveLocation" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'EDIT-MESSAGE-LIVE-LOCATION)

(DEFUN STOP-MESSAGE-LIVE-LOCATION
       (&KEY CHAT--ID MESSAGE--ID INLINE--MESSAGE--ID REPLY--MARKUP)
  "https://core.telegram.org/bots/api#stopmessagelivelocation
Use this method to stop updating a live location message before live_period expires. On success, if the message was sent by the bot, the sent Message is returned, otherwise True is returned."
  (LET ((OPTIONS (LIST)))
    (WHEN CHAT--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CHAT_ID CHAT--ID)))))
    (WHEN MESSAGE--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :MESSAGE_ID MESSAGE--ID)))))
    (WHEN INLINE--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST (CONS :INLINE_MESSAGE_ID INLINE--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "stopMessageLiveLocation" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'STOP-MESSAGE-LIVE-LOCATION)

(DEFUN SEND-VENUE
       (CHAT--ID LATITUDE LONGITUDE TITLE ADDRESS
        &KEY FOURSQUARE--ID FOURSQUARE--TYPE DISABLE--NOTIFICATION
        REPLY--TO--MESSAGE--ID REPLY--MARKUP)
  "https://core.telegram.org/bots/api#sendvenue
Use this method to send information about a venue. On success, the sent Message is returned."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE LATITUDE FLOAT)
  (CHECK-TYPE LONGITUDE FLOAT)
  (CHECK-TYPE TITLE STRING)
  (CHECK-TYPE ADDRESS STRING)
  (LET ((OPTIONS
         (LIST (CONS :CHAT_ID CHAT--ID) (CONS :LATITUDE LATITUDE)
               (CONS :LONGITUDE LONGITUDE) (CONS :TITLE TITLE)
               (CONS :ADDRESS ADDRESS))))
    (WHEN FOURSQUARE--ID
      (SETF OPTIONS
              (NCONC OPTIONS (LIST (CONS :FOURSQUARE_ID FOURSQUARE--ID)))))
    (WHEN FOURSQUARE--TYPE
      (SETF OPTIONS
              (NCONC OPTIONS (LIST (CONS :FOURSQUARE_TYPE FOURSQUARE--TYPE)))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "sendVenue" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-VENUE)

(DEFUN SEND-CONTACT
       (CHAT--ID PHONE--NUMBER FIRST--NAME
        &KEY LAST--NAME VCARD DISABLE--NOTIFICATION REPLY--TO--MESSAGE--ID
        REPLY--MARKUP)
  "https://core.telegram.org/bots/api#sendcontact
Use this method to send phone contacts. On success, the sent Message is returned."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE PHONE--NUMBER STRING)
  (CHECK-TYPE FIRST--NAME STRING)
  (LET ((OPTIONS
         (LIST (CONS :CHAT_ID CHAT--ID) (CONS :PHONE_NUMBER PHONE--NUMBER)
               (CONS :FIRST_NAME FIRST--NAME))))
    (WHEN LAST--NAME
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :LAST_NAME LAST--NAME)))))
    (WHEN VCARD (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :VCARD VCARD)))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "sendContact" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-CONTACT)

(DEFUN SEND-POLL
       (CHAT--ID QUESTION OPTIONS
        &KEY DISABLE--NOTIFICATION REPLY--TO--MESSAGE--ID REPLY--MARKUP)
  "https://core.telegram.org/bots/api#sendpoll
Use this method to send a native poll. A native poll can't be sent to a private chat. On success, the sent Message is returned."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE QUESTION STRING)
  (CHECK-TYPE OPTIONS (ARRAY STRING))
  (LET ((OPTIONS
         (LIST (CONS :CHAT_ID CHAT--ID) (CONS :QUESTION QUESTION)
               (CONS :OPTIONS OPTIONS))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "sendPoll" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-POLL)

(DEFUN SEND-CHAT-ACTION (CHAT--ID ACTION)
  "https://core.telegram.org/bots/api#sendchataction
Use this method when you need to tell the user that something is happening on the bot's side. The status is set for 5 seconds or less (when a message arrives from your bot, Telegram clients clear its typing status). Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE ACTION STRING)
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :ACTION ACTION))))
    (LIST "sendChatAction" OPTIONS)))
(EXPORT 'SEND-CHAT-ACTION)

(DEFUN GET-USER-PROFILE-PHOTOS (USER--ID &KEY OFFSET LIMIT)
  "https://core.telegram.org/bots/api#getuserprofilephotos
Use this method to get a list of profile pictures for a user. Returns a UserProfilePhotos object."
  (CHECK-TYPE USER--ID INTEGER)
  (LET ((OPTIONS (LIST (CONS :USER_ID USER--ID))))
    (WHEN OFFSET (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :OFFSET OFFSET)))))
    (WHEN LIMIT (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :LIMIT LIMIT)))))
    (LIST "getUserProfilePhotos" OPTIONS :RETURN-TYPE '*USER-PROFILE-PHOTOS)))
(EXPORT 'GET-USER-PROFILE-PHOTOS)

(DEFUN GET-FILE (FILE--ID)
  "https://core.telegram.org/bots/api#getfile
Use this method to get basic info about a file and prepare it for downloading. For the moment, bots can download files of up to 20MB in size. On success, a File object is returned. The file can then be downloaded via the link https://api.telegram.org/file/bot<token>/<file_path>, where <file_path> is taken from the response. It is guaranteed that the link will be valid for at least 1 hour. When the link expires, a new one can be requested by calling getFile again."
  (CHECK-TYPE FILE--ID STRING)
  (LET ((OPTIONS (LIST (CONS :FILE_ID FILE--ID))))
    (LIST "getFile" OPTIONS :RETURN-TYPE '*FILE)))
(EXPORT 'GET-FILE)

(DEFUN KICK-CHAT-MEMBER (CHAT--ID USER--ID &KEY UNTIL--DATE)
  "https://core.telegram.org/bots/api#kickchatmember
Use this method to kick a user from a group, a supergroup or a channel. In the case of supergroups and channels, the user will not be able to return to the group on their own using invite links, etc., unless unbanned first. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE USER--ID INTEGER)
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :USER_ID USER--ID))))
    (WHEN UNTIL--DATE
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :UNTIL_DATE UNTIL--DATE)))))
    (LIST "kickChatMember" OPTIONS)))
(EXPORT 'KICK-CHAT-MEMBER)

(DEFUN UNBAN-CHAT-MEMBER (CHAT--ID USER--ID)
  "https://core.telegram.org/bots/api#unbanchatmember
Use this method to unban a previously kicked user in a supergroup or channel. The user will not return to the group or channel automatically, but will be able to join via link, etc. The bot must be an administrator for this to work. Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE USER--ID INTEGER)
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :USER_ID USER--ID))))
    (LIST "unbanChatMember" OPTIONS)))
(EXPORT 'UNBAN-CHAT-MEMBER)

(DEFUN RESTRICT-CHAT-MEMBER (CHAT--ID USER--ID PERMISSIONS &KEY UNTIL--DATE)
  "https://core.telegram.org/bots/api#restrictchatmember
Use this method to restrict a user in a supergroup. The bot must be an administrator in the supergroup for this to work and must have the appropriate admin rights. Pass True for all permissions to lift restrictions from a user. Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE USER--ID INTEGER)
  (CHECK-TYPE PERMISSIONS *CHAT-PERMISSIONS)
  (LET ((OPTIONS
         (LIST (CONS :CHAT_ID CHAT--ID) (CONS :USER_ID USER--ID)
               (CONS :PERMISSIONS PERMISSIONS))))
    (WHEN UNTIL--DATE
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :UNTIL_DATE UNTIL--DATE)))))
    (LIST "restrictChatMember" OPTIONS)))
(EXPORT 'RESTRICT-CHAT-MEMBER)

(DEFUN PROMOTE-CHAT-MEMBER
       (CHAT--ID USER--ID
        &KEY CAN--CHANGE--INFO CAN--POST--MESSAGES CAN--EDIT--MESSAGES
        CAN--DELETE--MESSAGES CAN--INVITE--USERS CAN--RESTRICT--MEMBERS
        CAN--PIN--MESSAGES CAN--PROMOTE--MEMBERS)
  "https://core.telegram.org/bots/api#promotechatmember
Use this method to promote or demote a user in a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Pass False for all boolean parameters to demote a user. Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE USER--ID INTEGER)
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :USER_ID USER--ID))))
    (WHEN CAN--CHANGE--INFO
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST (CONS :CAN_CHANGE_INFO CAN--CHANGE--INFO)))))
    (WHEN CAN--POST--MESSAGES
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST (CONS :CAN_POST_MESSAGES CAN--POST--MESSAGES)))))
    (WHEN CAN--EDIT--MESSAGES
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST (CONS :CAN_EDIT_MESSAGES CAN--EDIT--MESSAGES)))))
    (WHEN CAN--DELETE--MESSAGES
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :CAN_DELETE_MESSAGES CAN--DELETE--MESSAGES)))))
    (WHEN CAN--INVITE--USERS
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST (CONS :CAN_INVITE_USERS CAN--INVITE--USERS)))))
    (WHEN CAN--RESTRICT--MEMBERS
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :CAN_RESTRICT_MEMBERS CAN--RESTRICT--MEMBERS)))))
    (WHEN CAN--PIN--MESSAGES
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST (CONS :CAN_PIN_MESSAGES CAN--PIN--MESSAGES)))))
    (WHEN CAN--PROMOTE--MEMBERS
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :CAN_PROMOTE_MEMBERS CAN--PROMOTE--MEMBERS)))))
    (LIST "promoteChatMember" OPTIONS)))
(EXPORT 'PROMOTE-CHAT-MEMBER)

(DEFUN SET-CHAT-PERMISSIONS (CHAT--ID PERMISSIONS)
  "https://core.telegram.org/bots/api#setchatpermissions
Use this method to set default chat permissions for all members. The bot must be an administrator in the group or a supergroup for this to work and must have the can_restrict_members admin rights. Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE PERMISSIONS *CHAT-PERMISSIONS)
  (LET ((OPTIONS
         (LIST (CONS :CHAT_ID CHAT--ID) (CONS :PERMISSIONS PERMISSIONS))))
    (LIST "setChatPermissions" OPTIONS)))
(EXPORT 'SET-CHAT-PERMISSIONS)

(DEFUN EXPORT-CHAT-INVITE-LINK (CHAT--ID)
  "https://core.telegram.org/bots/api#exportchatinvitelink
Use this method to generate a new invite link for a chat; any previously generated link is revoked. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns the new invite link as String on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID))))
    (LIST "exportChatInviteLink" OPTIONS)))
(EXPORT 'EXPORT-CHAT-INVITE-LINK)

(DEFUN SET-CHAT-PHOTO (CHAT--ID PHOTO)
  "https://core.telegram.org/bots/api#setchatphoto
Use this method to set a new profile photo for the chat. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE PHOTO *INPUT-FILE)
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :PHOTO PHOTO))))
    (LIST "setChatPhoto" OPTIONS)))
(EXPORT 'SET-CHAT-PHOTO)

(DEFUN DELETE-CHAT-PHOTO (CHAT--ID)
  "https://core.telegram.org/bots/api#deletechatphoto
Use this method to delete a chat photo. Photos can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID))))
    (LIST "deleteChatPhoto" OPTIONS)))
(EXPORT 'DELETE-CHAT-PHOTO)

(DEFUN SET-CHAT-TITLE (CHAT--ID TITLE)
  "https://core.telegram.org/bots/api#setchattitle
Use this method to change the title of a chat. Titles can't be changed for private chats. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE TITLE STRING)
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :TITLE TITLE))))
    (LIST "setChatTitle" OPTIONS)))
(EXPORT 'SET-CHAT-TITLE)

(DEFUN SET-CHAT-DESCRIPTION (CHAT--ID &KEY DESCRIPTION)
  "https://core.telegram.org/bots/api#setchatdescription
Use this method to change the description of a group, a supergroup or a channel. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID))))
    (WHEN DESCRIPTION
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :DESCRIPTION DESCRIPTION)))))
    (LIST "setChatDescription" OPTIONS)))
(EXPORT 'SET-CHAT-DESCRIPTION)

(DEFUN PIN-CHAT-MESSAGE (CHAT--ID MESSAGE--ID &KEY DISABLE--NOTIFICATION)
  "https://core.telegram.org/bots/api#pinchatmessage
Use this method to pin a message in a group, a supergroup, or a channel. The bot must be an administrator in the chat for this to work and must have the ‘can_pin_messages’ admin right in the supergroup or ‘can_edit_messages’ admin right in the channel. Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE MESSAGE--ID INTEGER)
  (LET ((OPTIONS
         (LIST (CONS :CHAT_ID CHAT--ID) (CONS :MESSAGE_ID MESSAGE--ID))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (LIST "pinChatMessage" OPTIONS)))
(EXPORT 'PIN-CHAT-MESSAGE)

(DEFUN UNPIN-CHAT-MESSAGE (CHAT--ID)
  "https://core.telegram.org/bots/api#unpinchatmessage
Use this method to unpin a message in a group, a supergroup, or a channel. The bot must be an administrator in the chat for this to work and must have the ‘can_pin_messages’ admin right in the supergroup or ‘can_edit_messages’ admin right in the channel. Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID))))
    (LIST "unpinChatMessage" OPTIONS)))
(EXPORT 'UNPIN-CHAT-MESSAGE)

(DEFUN LEAVE-CHAT (CHAT--ID)
  "https://core.telegram.org/bots/api#leavechat
Use this method for your bot to leave a group, supergroup or channel. Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID))))
    (LIST "leaveChat" OPTIONS)))
(EXPORT 'LEAVE-CHAT)

(DEFUN GET-CHAT (CHAT--ID)
  "https://core.telegram.org/bots/api#getchat
Use this method to get up to date information about the chat (current name of the user for one-on-one conversations, current username of a user, group or channel, etc.). Returns a Chat object on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID))))
    (LIST "getChat" OPTIONS :RETURN-TYPE '*CHAT)))
(EXPORT 'GET-CHAT)

(DEFUN GET-CHAT-ADMINISTRATORS (CHAT--ID)
  "https://core.telegram.org/bots/api#getchatadministrators
Use this method to get a list of administrators in a chat. On success, returns an Array of ChatMember objects that contains information about all chat administrators except other bots. If the chat is a group or a supergroup and no administrators were appointed, only the creator will be returned."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID))))
    (LIST "getChatAdministrators" OPTIONS :RETURN-TYPE '*CHAT-MEMBER)))
(EXPORT 'GET-CHAT-ADMINISTRATORS)

(DEFUN GET-CHAT-MEMBERS-COUNT (CHAT--ID)
  "https://core.telegram.org/bots/api#getchatmemberscount
Use this method to get the number of members in a chat. Returns Int on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID))))
    (LIST "getChatMembersCount" OPTIONS)))
(EXPORT 'GET-CHAT-MEMBERS-COUNT)

(DEFUN GET-CHAT-MEMBER (CHAT--ID USER--ID)
  "https://core.telegram.org/bots/api#getchatmember
Use this method to get information about a member of a chat. Returns a ChatMember object on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE USER--ID INTEGER)
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :USER_ID USER--ID))))
    (LIST "getChatMember" OPTIONS :RETURN-TYPE '*CHAT-MEMBER)))
(EXPORT 'GET-CHAT-MEMBER)

(DEFUN SET-CHAT-STICKER-SET (CHAT--ID STICKER--SET--NAME)
  "https://core.telegram.org/bots/api#setchatstickerset
Use this method to set a new group sticker set for a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE STICKER--SET--NAME STRING)
  (LET ((OPTIONS
         (LIST (CONS :CHAT_ID CHAT--ID)
               (CONS :STICKER_SET_NAME STICKER--SET--NAME))))
    (LIST "setChatStickerSet" OPTIONS :RETURN-TYPE 'GET-CHAT)))
(EXPORT 'SET-CHAT-STICKER-SET)

(DEFUN DELETE-CHAT-STICKER-SET (CHAT--ID)
  "https://core.telegram.org/bots/api#deletechatstickerset
Use this method to delete a group sticker set from a supergroup. The bot must be an administrator in the chat for this to work and must have the appropriate admin rights. Use the field can_set_sticker_set optionally returned in getChat requests to check if the bot can use this method. Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID))))
    (LIST "deleteChatStickerSet" OPTIONS :RETURN-TYPE 'GET-CHAT)))
(EXPORT 'DELETE-CHAT-STICKER-SET)

(DEFUN ANSWER-CALLBACK-QUERY
       (CALLBACK--QUERY--ID &KEY TEXT SHOW--ALERT URL CACHE--TIME)
  "https://core.telegram.org/bots/api#answercallbackquery
Use this method to send answers to callback queries sent from inline keyboards. The answer will be displayed to the user as a notification at the top of the chat screen or as an alert. On success, True is returned."
  (CHECK-TYPE CALLBACK--QUERY--ID STRING)
  (LET ((OPTIONS (LIST (CONS :CALLBACK_QUERY_ID CALLBACK--QUERY--ID))))
    (WHEN TEXT (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :TEXT TEXT)))))
    (WHEN SHOW--ALERT
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :SHOW_ALERT SHOW--ALERT)))))
    (WHEN URL (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :URL URL)))))
    (WHEN CACHE--TIME
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CACHE_TIME CACHE--TIME)))))
    (LIST "answerCallbackQuery" OPTIONS)))
(EXPORT 'ANSWER-CALLBACK-QUERY)


;----Updating messages----
(DEFUN EDIT-MESSAGE-TEXT
       (TEXT
        &KEY CHAT--ID MESSAGE--ID INLINE--MESSAGE--ID PARSE--MODE
        DISABLE--WEB--PAGE--PREVIEW REPLY--MARKUP)
  "https://core.telegram.org/bots/api#editmessagetext
Use this method to edit text and game messages. On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned."
  (CHECK-TYPE TEXT STRING)
  (LET ((OPTIONS (LIST (CONS :TEXT TEXT))))
    (WHEN CHAT--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CHAT_ID CHAT--ID)))))
    (WHEN MESSAGE--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :MESSAGE_ID MESSAGE--ID)))))
    (WHEN INLINE--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST (CONS :INLINE_MESSAGE_ID INLINE--MESSAGE--ID)))))
    (WHEN PARSE--MODE
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :PARSE_MODE PARSE--MODE)))))
    (WHEN DISABLE--WEB--PAGE--PREVIEW
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_WEB_PAGE_PREVIEW
                            DISABLE--WEB--PAGE--PREVIEW)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "editMessageText" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'EDIT-MESSAGE-TEXT)

(DEFUN EDIT-MESSAGE-CAPTION
       (
        &KEY CHAT--ID MESSAGE--ID INLINE--MESSAGE--ID CAPTION PARSE--MODE
        REPLY--MARKUP)
  "https://core.telegram.org/bots/api#editmessagecaption
Use this method to edit captions of messages. On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned."
  (LET ((OPTIONS (LIST)))
    (WHEN CHAT--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CHAT_ID CHAT--ID)))))
    (WHEN MESSAGE--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :MESSAGE_ID MESSAGE--ID)))))
    (WHEN INLINE--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST (CONS :INLINE_MESSAGE_ID INLINE--MESSAGE--ID)))))
    (WHEN CAPTION
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CAPTION CAPTION)))))
    (WHEN PARSE--MODE
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :PARSE_MODE PARSE--MODE)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "editMessageCaption" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'EDIT-MESSAGE-CAPTION)

(DEFUN EDIT-MESSAGE-MEDIA
       (MEDIA &KEY CHAT--ID MESSAGE--ID INLINE--MESSAGE--ID REPLY--MARKUP)
  "https://core.telegram.org/bots/api#editmessagemedia
Use this method to edit animation, audio, document, photo, or video messages. If a message is a part of a message album, then it can be edited only to a photo or a video. Otherwise, message type can be changed arbitrarily. When inline message is edited, new file can't be uploaded. Use previously uploaded file via its file_id or specify a URL. On success, if the edited message was sent by the bot, the edited Message is returned, otherwise True is returned."
  (CHECK-TYPE MEDIA *INPUT-MEDIA)
  (LET ((OPTIONS (LIST (CONS :MEDIA MEDIA))))
    (WHEN CHAT--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CHAT_ID CHAT--ID)))))
    (WHEN MESSAGE--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :MESSAGE_ID MESSAGE--ID)))))
    (WHEN INLINE--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST (CONS :INLINE_MESSAGE_ID INLINE--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "editMessageMedia" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'EDIT-MESSAGE-MEDIA)

(DEFUN EDIT-MESSAGE-REPLY-MARKUP
       (&KEY CHAT--ID MESSAGE--ID INLINE--MESSAGE--ID REPLY--MARKUP)
  "https://core.telegram.org/bots/api#editmessagereplymarkup
Use this method to edit only the reply markup of messages. On success, if edited message is sent by the bot, the edited Message is returned, otherwise True is returned."
  (LET ((OPTIONS (LIST)))
    (WHEN CHAT--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CHAT_ID CHAT--ID)))))
    (WHEN MESSAGE--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :MESSAGE_ID MESSAGE--ID)))))
    (WHEN INLINE--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST (CONS :INLINE_MESSAGE_ID INLINE--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "editMessageReplyMarkup" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'EDIT-MESSAGE-REPLY-MARKUP)

(DEFUN STOP-POLL (CHAT--ID MESSAGE--ID &KEY REPLY--MARKUP)
  "https://core.telegram.org/bots/api#stoppoll
Use this method to stop a poll which was sent by the bot. On success, the stopped Poll with the final results is returned."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE MESSAGE--ID INTEGER)
  (LET ((OPTIONS
         (LIST (CONS :CHAT_ID CHAT--ID) (CONS :MESSAGE_ID MESSAGE--ID))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "stopPoll" OPTIONS :RETURN-TYPE '*POLL)))
(EXPORT 'STOP-POLL)

(DEFUN DELETE-MESSAGE (CHAT--ID MESSAGE--ID)
  "https://core.telegram.org/bots/api#deletemessage
Use this method to delete a message, including service messages, with the following limitations:- A message can only be deleted if it was sent less than 48 hours ago.- Bots can delete outgoing messages in private chats, groups, and supergroups.- Bots can delete incoming messages in private chats.- Bots granted can_post_messages permissions can delete outgoing messages in channels.- If the bot is an administrator of a group, it can delete any message there.- If the bot has can_delete_messages permission in a supergroup or a channel, it can delete any message there.Returns True on success."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE MESSAGE--ID INTEGER)
  (LET ((OPTIONS
         (LIST (CONS :CHAT_ID CHAT--ID) (CONS :MESSAGE_ID MESSAGE--ID))))
    (LIST "deleteMessage" OPTIONS)))
(EXPORT 'DELETE-MESSAGE)


;----Stickers----
(DEFCLASS *STICKER NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "Sticker")
           (FILE--ID :INITARG :FILE--ID :INITFORM NIL :ACCESSOR TG-FILE--ID
            :TYPE STRING :DOCUMENTATION "Identifier for this file")
           (WIDTH :INITARG :WIDTH :INITFORM NIL :ACCESSOR TG-WIDTH :TYPE
            INTEGER :DOCUMENTATION "Sticker width")
           (HEIGHT :INITARG :HEIGHT :INITFORM NIL :ACCESSOR TG-HEIGHT :TYPE
            INTEGER :DOCUMENTATION "Sticker height")
           (IS--ANIMATED :INITARG :IS--ANIMATED :INITFORM NIL :ACCESSOR
            TG-IS--ANIMATED :TYPE BOOLEAN :DOCUMENTATION
            "True, if the sticker is animated")
           (THUMB :INITARG :THUMB :ACCESSOR TG-THUMB :TYPE *PHOTO-SIZE
            :DOCUMENTATION "Sticker thumbnail in the .webp or .jpg format")
           (EMOJI :INITARG :EMOJI :ACCESSOR TG-EMOJI :TYPE STRING
            :DOCUMENTATION "Emoji associated with the sticker")
           (SET--NAME :INITARG :SET--NAME :ACCESSOR TG-SET--NAME :TYPE STRING
            :DOCUMENTATION
            "Name of the sticker set to which the sticker belongs")
           (MASK--POSITION :INITARG :MASK--POSITION :ACCESSOR TG-MASK--POSITION
            :TYPE *MASK-POSITION :DOCUMENTATION
            "For mask stickers, the position where the mask should be placed")
           (FILE--SIZE :INITARG :FILE--SIZE :ACCESSOR TG-FILE--SIZE :TYPE
            INTEGER :DOCUMENTATION "File size"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#sticker
This object represents a sticker."))
(EXPORT '*STICKER)

(DEFCLASS *STICKER-SET NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "StickerSet")
           (NAME :INITARG :NAME :INITFORM NIL :ACCESSOR TG-NAME :TYPE STRING
            :DOCUMENTATION "Sticker set name")
           (TITLE :INITARG :TITLE :INITFORM NIL :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Sticker set title")
           (IS--ANIMATED :INITARG :IS--ANIMATED :INITFORM NIL :ACCESSOR
            TG-IS--ANIMATED :TYPE BOOLEAN :DOCUMENTATION
            "True, if the sticker set contains animated stickers")
           (CONTAINS--MASKS :INITARG :CONTAINS--MASKS :INITFORM NIL :ACCESSOR
            TG-CONTAINS--MASKS :TYPE BOOLEAN :DOCUMENTATION
            "True, if the sticker set contains masks")
           (STICKERS :INITARG :STICKERS :INITFORM NIL :ACCESSOR TG-STICKERS
            :TYPE (ARRAY *STICKER) :DOCUMENTATION "List of all set stickers"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#stickerset
This object represents a sticker set."))
(EXPORT '*STICKER-SET)

(DEFCLASS *MASK-POSITION NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "MaskPosition")
           (POINT :INITARG :POINT :INITFORM NIL :ACCESSOR TG-POINT :TYPE STRING
            :DOCUMENTATION
            "The part of the face relative to which the mask should be placed. One of “forehead”, “eyes”, “mouth”, or “chin”.")
           (X--SHIFT :INITARG :X--SHIFT :INITFORM NIL :ACCESSOR TG-X--SHIFT
            :TYPE FLOAT :DOCUMENTATION
            "Shift by X-axis measured in widths of the mask scaled to the face size, from left to right. For example, choosing -1.0 will place mask just to the left of the default mask position.")
           (Y--SHIFT :INITARG :Y--SHIFT :INITFORM NIL :ACCESSOR TG-Y--SHIFT
            :TYPE FLOAT :DOCUMENTATION
            "Shift by Y-axis measured in heights of the mask scaled to the face size, from top to bottom. For example, 1.0 will place the mask just below the default mask position.")
           (SCALE :INITARG :SCALE :INITFORM NIL :ACCESSOR TG-SCALE :TYPE FLOAT
            :DOCUMENTATION
            "Mask scaling coefficient. For example, 2.0 means double size."))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#maskposition
This object describes the position on faces where a mask should be placed by default."))
(EXPORT '*MASK-POSITION)

(DEFUN SEND-STICKER
       (CHAT--ID STICKER
        &KEY DISABLE--NOTIFICATION REPLY--TO--MESSAGE--ID REPLY--MARKUP)
  "https://core.telegram.org/bots/api#sendsticker
Use this method to send static .WEBP or animated .TGS stickers. On success, the sent Message is returned."
  (CHECK-TYPE CHAT--ID (OR INTEGER STRING))
  (CHECK-TYPE STICKER (OR *INPUT-FILE STRING))
  (LET ((OPTIONS (LIST (CONS :CHAT_ID CHAT--ID) (CONS :STICKER STICKER))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "sendSticker" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-STICKER)

(DEFUN GET-STICKER-SET (NAME)
  "https://core.telegram.org/bots/api#getstickerset
Use this method to get a sticker set. On success, a StickerSet object is returned."
  (CHECK-TYPE NAME STRING)
  (LET ((OPTIONS (LIST (CONS :NAME NAME))))
    (LIST "getStickerSet" OPTIONS :RETURN-TYPE '*STICKER-SET)))
(EXPORT 'GET-STICKER-SET)

(DEFUN UPLOAD-STICKER-FILE (USER--ID PNG--STICKER)
  "https://core.telegram.org/bots/api#uploadstickerfile
Use this method to upload a .png file with a sticker for later use in createNewStickerSet and addStickerToSet methods (can be used multiple times). Returns the uploaded File on success."
  (CHECK-TYPE USER--ID INTEGER)
  (CHECK-TYPE PNG--STICKER *INPUT-FILE)
  (LET ((OPTIONS
         (LIST (CONS :USER_ID USER--ID) (CONS :PNG_STICKER PNG--STICKER))))
    (LIST "uploadStickerFile" OPTIONS :RETURN-TYPE '*FILE)))
(EXPORT 'UPLOAD-STICKER-FILE)

(DEFUN CREATE-NEW-STICKER-SET
       (USER--ID NAME TITLE PNG--STICKER EMOJIS
        &KEY CONTAINS--MASKS MASK--POSITION)
  "https://core.telegram.org/bots/api#createnewstickerset
Use this method to create new sticker set owned by a user. The bot will be able to edit the created sticker set. Returns True on success."
  (CHECK-TYPE USER--ID INTEGER)
  (CHECK-TYPE NAME STRING)
  (CHECK-TYPE TITLE STRING)
  (CHECK-TYPE PNG--STICKER (OR *INPUT-FILE STRING))
  (CHECK-TYPE EMOJIS STRING)
  (LET ((OPTIONS
         (LIST (CONS :USER_ID USER--ID) (CONS :NAME NAME) (CONS :TITLE TITLE)
               (CONS :PNG_STICKER PNG--STICKER) (CONS :EMOJIS EMOJIS))))
    (WHEN CONTAINS--MASKS
      (SETF OPTIONS
              (NCONC OPTIONS (LIST (CONS :CONTAINS_MASKS CONTAINS--MASKS)))))
    (WHEN MASK--POSITION
      (SETF OPTIONS
              (NCONC OPTIONS (LIST (CONS :MASK_POSITION MASK--POSITION)))))
    (LIST "createNewStickerSet" OPTIONS)))
(EXPORT 'CREATE-NEW-STICKER-SET)

(DEFUN ADD-STICKER-TO-SET
       (USER--ID NAME PNG--STICKER EMOJIS &KEY MASK--POSITION)
  "https://core.telegram.org/bots/api#addstickertoset
Use this method to add a new sticker to a set created by the bot. Returns True on success."
  (CHECK-TYPE USER--ID INTEGER)
  (CHECK-TYPE NAME STRING)
  (CHECK-TYPE PNG--STICKER (OR *INPUT-FILE STRING))
  (CHECK-TYPE EMOJIS STRING)
  (LET ((OPTIONS
         (LIST (CONS :USER_ID USER--ID) (CONS :NAME NAME)
               (CONS :PNG_STICKER PNG--STICKER) (CONS :EMOJIS EMOJIS))))
    (WHEN MASK--POSITION
      (SETF OPTIONS
              (NCONC OPTIONS (LIST (CONS :MASK_POSITION MASK--POSITION)))))
    (LIST "addStickerToSet" OPTIONS)))
(EXPORT 'ADD-STICKER-TO-SET)

(DEFUN SET-STICKER-POSITION-IN-SET (STICKER POSITION)
  "https://core.telegram.org/bots/api#setstickerpositioninset
Use this method to move a sticker in a set created by the bot to a specific position . Returns True on success."
  (CHECK-TYPE STICKER STRING)
  (CHECK-TYPE POSITION INTEGER)
  (LET ((OPTIONS (LIST (CONS :STICKER STICKER) (CONS :POSITION POSITION))))
    (LIST "setStickerPositionInSet" OPTIONS)))
(EXPORT 'SET-STICKER-POSITION-IN-SET)

(DEFUN DELETE-STICKER-FROM-SET (STICKER)
  "https://core.telegram.org/bots/api#deletestickerfromset
Use this method to delete a sticker from a set created by the bot. Returns True on success."
  (CHECK-TYPE STICKER STRING)
  (LET ((OPTIONS (LIST (CONS :STICKER STICKER))))
    (LIST "deleteStickerFromSet" OPTIONS)))
(EXPORT 'DELETE-STICKER-FROM-SET)


;----Inline mode----
(DEFCLASS *INLINE-QUERY NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "InlineQuery")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this query")
           (FROM :INITARG :FROM :INITFORM NIL :ACCESSOR TG-FROM :TYPE *USER
            :DOCUMENTATION "Sender")
           (LOCATION :INITARG :LOCATION :ACCESSOR TG-LOCATION :TYPE *LOCATION
            :DOCUMENTATION
            "Sender location, only for bots that request user location")
           (QUERY :INITARG :QUERY :INITFORM NIL :ACCESSOR TG-QUERY :TYPE STRING
            :DOCUMENTATION "Text of the query (up to 512 characters)")
           (OFFSET :INITARG :OFFSET :INITFORM NIL :ACCESSOR TG-OFFSET :TYPE
            STRING :DOCUMENTATION
            "Offset of the results to be returned, can be controlled by the bot"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#inlinequery
This object represents an incoming inline query. When the user sends an empty query, your bot could return some default or trending results."))
(EXPORT '*INLINE-QUERY)

(DEFUN ANSWER-INLINE-QUERY
       (INLINE--QUERY--ID RESULTS
        &KEY CACHE--TIME IS--PERSONAL NEXT--OFFSET SWITCH--PM--TEXT
        SWITCH--PM--PARAMETER)
  "https://core.telegram.org/bots/api#answerinlinequery
Use this method to send answers to an inline query. On success, True is returned.No more than 50 results per query are allowed."
  (CHECK-TYPE INLINE--QUERY--ID STRING)
  (CHECK-TYPE RESULTS (ARRAY *INLINE-QUERY-RESULT))
  (LET ((OPTIONS
         (LIST (CONS :INLINE_QUERY_ID INLINE--QUERY--ID)
               (CONS :RESULTS RESULTS))))
    (WHEN CACHE--TIME
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CACHE_TIME CACHE--TIME)))))
    (WHEN IS--PERSONAL
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :IS_PERSONAL IS--PERSONAL)))))
    (WHEN NEXT--OFFSET
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :NEXT_OFFSET NEXT--OFFSET)))))
    (WHEN SWITCH--PM--TEXT
      (SETF OPTIONS
              (NCONC OPTIONS (LIST (CONS :SWITCH_PM_TEXT SWITCH--PM--TEXT)))))
    (WHEN SWITCH--PM--PARAMETER
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :SWITCH_PM_PARAMETER SWITCH--PM--PARAMETER)))))
    (LIST "answerInlineQuery" OPTIONS)))
(EXPORT 'ANSWER-INLINE-QUERY)

(DEFUN *INLINE-QUERY-RESULT ()
  "https://core.telegram.org/bots/api#inlinequeryresult
This object represents one result of an inline query. Telegram clients currently support results of the following 20 types:"
  (LET ((OPTIONS (LIST)))
    (LIST "InlineQueryResult" OPTIONS)))
(EXPORT '*INLINE-QUERY-RESULT)

(DEFCLASS *INLINE-QUERY-RESULT-ARTICLE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultArticle")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be article")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 Bytes")
           (TITLE :INITARG :TITLE :INITFORM NIL :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title of the result")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :INITFORM
            NIL :ACCESSOR TG-INPUT--MESSAGE--CONTENT :TYPE
            *INPUT-MESSAGE-CONTENT :DOCUMENTATION
            "Content of the message to be sent")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (URL :INITARG :URL :ACCESSOR TG-URL :TYPE STRING :DOCUMENTATION
            "URL of the result")
           (HIDE--URL :INITARG :HIDE--URL :ACCESSOR TG-HIDE--URL :TYPE BOOLEAN
            :DOCUMENTATION
            "Pass True, if you don't want the URL to be shown in the message")
           (DESCRIPTION :INITARG :DESCRIPTION :ACCESSOR TG-DESCRIPTION :TYPE
            STRING :DOCUMENTATION "Short description of the result")
           (THUMB--URL :INITARG :THUMB--URL :ACCESSOR TG-THUMB--URL :TYPE
            STRING :DOCUMENTATION "Url of the thumbnail for the result")
           (THUMB--WIDTH :INITARG :THUMB--WIDTH :ACCESSOR TG-THUMB--WIDTH :TYPE
            INTEGER :DOCUMENTATION "Thumbnail width")
           (THUMB--HEIGHT :INITARG :THUMB--HEIGHT :ACCESSOR TG-THUMB--HEIGHT
            :TYPE INTEGER :DOCUMENTATION "Thumbnail height"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultarticle
Represents a link to an article or web page."))
(EXPORT '*INLINE-QUERY-RESULT-ARTICLE)

(DEFCLASS *INLINE-QUERY-RESULT-PHOTO NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultPhoto")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be photo")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (PHOTO--URL :INITARG :PHOTO--URL :INITFORM NIL :ACCESSOR
            TG-PHOTO--URL :TYPE STRING :DOCUMENTATION
            "A valid URL of the photo. Photo must be in jpeg format. Photo size must not exceed 5MB")
           (THUMB--URL :INITARG :THUMB--URL :INITFORM NIL :ACCESSOR
            TG-THUMB--URL :TYPE STRING :DOCUMENTATION
            "URL of the thumbnail for the photo")
           (PHOTO--WIDTH :INITARG :PHOTO--WIDTH :ACCESSOR TG-PHOTO--WIDTH :TYPE
            INTEGER :DOCUMENTATION "Width of the photo")
           (PHOTO--HEIGHT :INITARG :PHOTO--HEIGHT :ACCESSOR TG-PHOTO--HEIGHT
            :TYPE INTEGER :DOCUMENTATION "Height of the photo")
           (TITLE :INITARG :TITLE :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title for the result")
           (DESCRIPTION :INITARG :DESCRIPTION :ACCESSOR TG-DESCRIPTION :TYPE
            STRING :DOCUMENTATION "Short description of the result")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the photo to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the photo"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultphoto
Represents a link to a photo. By default, this photo will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo."))
(EXPORT '*INLINE-QUERY-RESULT-PHOTO)

(DEFCLASS *INLINE-QUERY-RESULT-GIF NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultGif")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be gif")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (GIF--URL :INITARG :GIF--URL :INITFORM NIL :ACCESSOR TG-GIF--URL
            :TYPE STRING :DOCUMENTATION
            "A valid URL for the GIF file. File size must not exceed 1MB")
           (GIF--WIDTH :INITARG :GIF--WIDTH :ACCESSOR TG-GIF--WIDTH :TYPE
            INTEGER :DOCUMENTATION "Width of the GIF")
           (GIF--HEIGHT :INITARG :GIF--HEIGHT :ACCESSOR TG-GIF--HEIGHT :TYPE
            INTEGER :DOCUMENTATION "Height of the GIF")
           (GIF--DURATION :INITARG :GIF--DURATION :ACCESSOR TG-GIF--DURATION
            :TYPE INTEGER :DOCUMENTATION "Duration of the GIF")
           (THUMB--URL :INITARG :THUMB--URL :INITFORM NIL :ACCESSOR
            TG-THUMB--URL :TYPE STRING :DOCUMENTATION
            "URL of the static thumbnail for the result (jpeg or gif)")
           (TITLE :INITARG :TITLE :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title for the result")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the GIF file to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the GIF animation"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultgif
Represents a link to an animated GIF file. By default, this animated GIF file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation."))
(EXPORT '*INLINE-QUERY-RESULT-GIF)

(DEFCLASS *INLINE-QUERY-RESULT-MPEG-4-*GIF NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultMpeg4Gif")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be mpeg4_gif")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (MPEG-4--URL :INITARG :MPEG-4--URL :INITFORM NIL :ACCESSOR
            TG-MPEG-4--URL :TYPE STRING :DOCUMENTATION
            "A valid URL for the MP4 file. File size must not exceed 1MB")
           (MPEG-4--WIDTH :INITARG :MPEG-4--WIDTH :ACCESSOR TG-MPEG-4--WIDTH
            :TYPE INTEGER :DOCUMENTATION "Video width")
           (MPEG-4--HEIGHT :INITARG :MPEG-4--HEIGHT :ACCESSOR TG-MPEG-4--HEIGHT
            :TYPE INTEGER :DOCUMENTATION "Video height")
           (MPEG-4--DURATION :INITARG :MPEG-4--DURATION :ACCESSOR
            TG-MPEG-4--DURATION :TYPE INTEGER :DOCUMENTATION "Video duration")
           (THUMB--URL :INITARG :THUMB--URL :INITFORM NIL :ACCESSOR
            TG-THUMB--URL :TYPE STRING :DOCUMENTATION
            "URL of the static thumbnail (jpeg or gif) for the result")
           (TITLE :INITARG :TITLE :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title for the result")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the MPEG-4 file to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the video animation"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultmpeg4gif
Represents a link to a video animation (H.264/MPEG-4 AVC video without sound). By default, this animated MPEG-4 file will be sent by the user with optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation."))
(EXPORT '*INLINE-QUERY-RESULT-MPEG-4-*GIF)

(DEFCLASS *INLINE-QUERY-RESULT-VIDEO NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultVideo")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be video")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (VIDEO--URL :INITARG :VIDEO--URL :INITFORM NIL :ACCESSOR
            TG-VIDEO--URL :TYPE STRING :DOCUMENTATION
            "A valid URL for the embedded video player or video file")
           (MIME--TYPE :INITARG :MIME--TYPE :INITFORM NIL :ACCESSOR
            TG-MIME--TYPE :TYPE STRING :DOCUMENTATION
            "Mime type of the content of video url, “text/html” or “video/mp4”")
           (THUMB--URL :INITARG :THUMB--URL :INITFORM NIL :ACCESSOR
            TG-THUMB--URL :TYPE STRING :DOCUMENTATION
            "URL of the thumbnail (jpeg only) for the video")
           (TITLE :INITARG :TITLE :INITFORM NIL :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title for the result")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the video to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (VIDEO--WIDTH :INITARG :VIDEO--WIDTH :ACCESSOR TG-VIDEO--WIDTH :TYPE
            INTEGER :DOCUMENTATION "Video width")
           (VIDEO--HEIGHT :INITARG :VIDEO--HEIGHT :ACCESSOR TG-VIDEO--HEIGHT
            :TYPE INTEGER :DOCUMENTATION "Video height")
           (VIDEO--DURATION :INITARG :VIDEO--DURATION :ACCESSOR
            TG-VIDEO--DURATION :TYPE INTEGER :DOCUMENTATION
            "Video duration in seconds")
           (DESCRIPTION :INITARG :DESCRIPTION :ACCESSOR TG-DESCRIPTION :TYPE
            STRING :DOCUMENTATION "Short description of the result")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the video. This field is required if InlineQueryResultVideo is used to send an HTML-page as a result (e.g., a YouTube video)."))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultvideo
Represents a link to a page containing an embedded video player or a video file. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video."))
(EXPORT '*INLINE-QUERY-RESULT-VIDEO)

(DEFCLASS *INLINE-QUERY-RESULT-AUDIO NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultAudio")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be audio")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (AUDIO--URL :INITARG :AUDIO--URL :INITFORM NIL :ACCESSOR
            TG-AUDIO--URL :TYPE STRING :DOCUMENTATION
            "A valid URL for the audio file")
           (TITLE :INITARG :TITLE :INITFORM NIL :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION "Caption, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (PERFORMER :INITARG :PERFORMER :ACCESSOR TG-PERFORMER :TYPE STRING
            :DOCUMENTATION "Performer")
           (AUDIO--DURATION :INITARG :AUDIO--DURATION :ACCESSOR
            TG-AUDIO--DURATION :TYPE INTEGER :DOCUMENTATION
            "Audio duration in seconds")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the audio"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultaudio
Represents a link to an mp3 audio file. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio."))
(EXPORT '*INLINE-QUERY-RESULT-AUDIO)

(DEFCLASS *INLINE-QUERY-RESULT-VOICE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultVoice")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be voice")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (VOICE--URL :INITARG :VOICE--URL :INITFORM NIL :ACCESSOR
            TG-VOICE--URL :TYPE STRING :DOCUMENTATION
            "A valid URL for the voice recording")
           (TITLE :INITARG :TITLE :INITFORM NIL :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Recording title")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION "Caption, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (VOICE--DURATION :INITARG :VOICE--DURATION :ACCESSOR
            TG-VOICE--DURATION :TYPE INTEGER :DOCUMENTATION
            "Recording duration in seconds")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the voice recording"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultvoice
Represents a link to a voice recording in an .ogg container encoded with OPUS. By default, this voice recording will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the the voice message."))
(EXPORT '*INLINE-QUERY-RESULT-VOICE)

(DEFCLASS *INLINE-QUERY-RESULT-DOCUMENT NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultDocument")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be document")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (TITLE :INITARG :TITLE :INITFORM NIL :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title for the result")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the document to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (DOCUMENT--URL :INITARG :DOCUMENT--URL :INITFORM NIL :ACCESSOR
            TG-DOCUMENT--URL :TYPE STRING :DOCUMENTATION
            "A valid URL for the file")
           (MIME--TYPE :INITARG :MIME--TYPE :INITFORM NIL :ACCESSOR
            TG-MIME--TYPE :TYPE STRING :DOCUMENTATION
            "Mime type of the content of the file, either “application/pdf” or “application/zip”")
           (DESCRIPTION :INITARG :DESCRIPTION :ACCESSOR TG-DESCRIPTION :TYPE
            STRING :DOCUMENTATION "Short description of the result")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the file")
           (THUMB--URL :INITARG :THUMB--URL :ACCESSOR TG-THUMB--URL :TYPE
            STRING :DOCUMENTATION
            "URL of the thumbnail (jpeg only) for the file")
           (THUMB--WIDTH :INITARG :THUMB--WIDTH :ACCESSOR TG-THUMB--WIDTH :TYPE
            INTEGER :DOCUMENTATION "Thumbnail width")
           (THUMB--HEIGHT :INITARG :THUMB--HEIGHT :ACCESSOR TG-THUMB--HEIGHT
            :TYPE INTEGER :DOCUMENTATION "Thumbnail height"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultdocument
Represents a link to a file. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file. Currently, only .PDF and .ZIP files can be sent using this method."))
(EXPORT '*INLINE-QUERY-RESULT-DOCUMENT)

(DEFCLASS *INLINE-QUERY-RESULT-LOCATION NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultLocation")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be location")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 Bytes")
           (LATITUDE :INITARG :LATITUDE :INITFORM NIL :ACCESSOR TG-LATITUDE
            :TYPE FLOAT :DOCUMENTATION "Location latitude in degrees")
           (LONGITUDE :INITARG :LONGITUDE :INITFORM NIL :ACCESSOR TG-LONGITUDE
            :TYPE FLOAT :DOCUMENTATION "Location longitude in degrees")
           (TITLE :INITARG :TITLE :INITFORM NIL :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Location title")
           (LIVE--PERIOD :INITARG :LIVE--PERIOD :ACCESSOR TG-LIVE--PERIOD :TYPE
            INTEGER :DOCUMENTATION
            "Period in seconds for which the location can be updated, should be between 60 and 86400.")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the location")
           (THUMB--URL :INITARG :THUMB--URL :ACCESSOR TG-THUMB--URL :TYPE
            STRING :DOCUMENTATION "Url of the thumbnail for the result")
           (THUMB--WIDTH :INITARG :THUMB--WIDTH :ACCESSOR TG-THUMB--WIDTH :TYPE
            INTEGER :DOCUMENTATION "Thumbnail width")
           (THUMB--HEIGHT :INITARG :THUMB--HEIGHT :ACCESSOR TG-THUMB--HEIGHT
            :TYPE INTEGER :DOCUMENTATION "Thumbnail height"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultlocation
Represents a location on a map. By default, the location will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the location."))
(EXPORT '*INLINE-QUERY-RESULT-LOCATION)

(DEFCLASS *INLINE-QUERY-RESULT-VENUE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultVenue")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be venue")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 Bytes")
           (LATITUDE :INITARG :LATITUDE :INITFORM NIL :ACCESSOR TG-LATITUDE
            :TYPE *FLOAT :DOCUMENTATION
            "Latitude of the venue location in degrees")
           (LONGITUDE :INITARG :LONGITUDE :INITFORM NIL :ACCESSOR TG-LONGITUDE
            :TYPE *FLOAT :DOCUMENTATION
            "Longitude of the venue location in degrees")
           (TITLE :INITARG :TITLE :INITFORM NIL :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title of the venue")
           (ADDRESS :INITARG :ADDRESS :INITFORM NIL :ACCESSOR TG-ADDRESS :TYPE
            STRING :DOCUMENTATION "Address of the venue")
           (FOURSQUARE--ID :INITARG :FOURSQUARE--ID :ACCESSOR TG-FOURSQUARE--ID
            :TYPE STRING :DOCUMENTATION
            "Foursquare identifier of the venue if known")
           (FOURSQUARE--TYPE :INITARG :FOURSQUARE--TYPE :ACCESSOR
            TG-FOURSQUARE--TYPE :TYPE STRING :DOCUMENTATION
            "Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the venue")
           (THUMB--URL :INITARG :THUMB--URL :ACCESSOR TG-THUMB--URL :TYPE
            STRING :DOCUMENTATION "Url of the thumbnail for the result")
           (THUMB--WIDTH :INITARG :THUMB--WIDTH :ACCESSOR TG-THUMB--WIDTH :TYPE
            INTEGER :DOCUMENTATION "Thumbnail width")
           (THUMB--HEIGHT :INITARG :THUMB--HEIGHT :ACCESSOR TG-THUMB--HEIGHT
            :TYPE INTEGER :DOCUMENTATION "Thumbnail height"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultvenue
Represents a venue. By default, the venue will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the venue."))
(EXPORT '*INLINE-QUERY-RESULT-VENUE)

(DEFCLASS *INLINE-QUERY-RESULT-CONTACT NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultContact")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be contact")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 Bytes")
           (PHONE--NUMBER :INITARG :PHONE--NUMBER :INITFORM NIL :ACCESSOR
            TG-PHONE--NUMBER :TYPE STRING :DOCUMENTATION
            "Contact's phone number")
           (FIRST--NAME :INITARG :FIRST--NAME :INITFORM NIL :ACCESSOR
            TG-FIRST--NAME :TYPE STRING :DOCUMENTATION "Contact's first name")
           (LAST--NAME :INITARG :LAST--NAME :ACCESSOR TG-LAST--NAME :TYPE
            STRING :DOCUMENTATION "Contact's last name")
           (VCARD :INITARG :VCARD :ACCESSOR TG-VCARD :TYPE STRING
            :DOCUMENTATION
            "Additional data about the contact in the form of a vCard, 0-2048 bytes")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the contact")
           (THUMB--URL :INITARG :THUMB--URL :ACCESSOR TG-THUMB--URL :TYPE
            STRING :DOCUMENTATION "Url of the thumbnail for the result")
           (THUMB--WIDTH :INITARG :THUMB--WIDTH :ACCESSOR TG-THUMB--WIDTH :TYPE
            INTEGER :DOCUMENTATION "Thumbnail width")
           (THUMB--HEIGHT :INITARG :THUMB--HEIGHT :ACCESSOR TG-THUMB--HEIGHT
            :TYPE INTEGER :DOCUMENTATION "Thumbnail height"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultcontact
Represents a contact with a phone number. By default, this contact will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the contact."))
(EXPORT '*INLINE-QUERY-RESULT-CONTACT)

(DEFCLASS *INLINE-QUERY-RESULT-GAME NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultGame")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be game")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (GAME--SHORT--NAME :INITARG :GAME--SHORT--NAME :INITFORM NIL
            :ACCESSOR TG-GAME--SHORT--NAME :TYPE STRING :DOCUMENTATION
            "Short name of the game")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultgame
Represents a Game."))
(EXPORT '*INLINE-QUERY-RESULT-GAME)

(DEFCLASS *INLINE-QUERY-RESULT-CACHED-PHOTO NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultCachedPhoto")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be photo")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (PHOTO--FILE--ID :INITARG :PHOTO--FILE--ID :INITFORM NIL :ACCESSOR
            TG-PHOTO--FILE--ID :TYPE STRING :DOCUMENTATION
            "A valid file identifier of the photo")
           (TITLE :INITARG :TITLE :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title for the result")
           (DESCRIPTION :INITARG :DESCRIPTION :ACCESSOR TG-DESCRIPTION :TYPE
            STRING :DOCUMENTATION "Short description of the result")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the photo to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the photo"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultcachedphoto
Represents a link to a photo stored on the Telegram servers. By default, this photo will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the photo."))
(EXPORT '*INLINE-QUERY-RESULT-CACHED-PHOTO)

(DEFCLASS *INLINE-QUERY-RESULT-CACHED-GIF NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultCachedGif")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be gif")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (GIF--FILE--ID :INITARG :GIF--FILE--ID :INITFORM NIL :ACCESSOR
            TG-GIF--FILE--ID :TYPE STRING :DOCUMENTATION
            "A valid file identifier for the GIF file")
           (TITLE :INITARG :TITLE :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title for the result")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the GIF file to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the GIF animation"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultcachedgif
Represents a link to an animated GIF file stored on the Telegram servers. By default, this animated GIF file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with specified content instead of the animation."))
(EXPORT '*INLINE-QUERY-RESULT-CACHED-GIF)

(DEFCLASS *INLINE-QUERY-RESULT-CACHED-MPEG-4-*GIF NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultCachedMpeg4Gif")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be mpeg4_gif")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (MPEG-4--FILE--ID :INITARG :MPEG-4--FILE--ID :INITFORM NIL :ACCESSOR
            TG-MPEG-4--FILE--ID :TYPE STRING :DOCUMENTATION
            "A valid file identifier for the MP4 file")
           (TITLE :INITARG :TITLE :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title for the result")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the MPEG-4 file to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the video animation"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultcachedmpeg4gif
Represents a link to a video animation (H.264/MPEG-4 AVC video without sound) stored on the Telegram servers. By default, this animated MPEG-4 file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the animation."))
(EXPORT '*INLINE-QUERY-RESULT-CACHED-MPEG-4-*GIF)

(DEFCLASS *INLINE-QUERY-RESULT-CACHED-STICKER NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultCachedSticker")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be sticker")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (STICKER--FILE--ID :INITARG :STICKER--FILE--ID :INITFORM NIL
            :ACCESSOR TG-STICKER--FILE--ID :TYPE STRING :DOCUMENTATION
            "A valid file identifier of the sticker")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the sticker"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultcachedsticker
Represents a link to a sticker stored on the Telegram servers. By default, this sticker will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the sticker."))
(EXPORT '*INLINE-QUERY-RESULT-CACHED-STICKER)

(DEFCLASS *INLINE-QUERY-RESULT-CACHED-DOCUMENT NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultCachedDocument")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be document")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (TITLE :INITARG :TITLE :INITFORM NIL :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title for the result")
           (DOCUMENT--FILE--ID :INITARG :DOCUMENT--FILE--ID :INITFORM NIL
            :ACCESSOR TG-DOCUMENT--FILE--ID :TYPE STRING :DOCUMENTATION
            "A valid file identifier for the file")
           (DESCRIPTION :INITARG :DESCRIPTION :ACCESSOR TG-DESCRIPTION :TYPE
            STRING :DOCUMENTATION "Short description of the result")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the document to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the file"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultcacheddocument
Represents a link to a file stored on the Telegram servers. By default, this file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the file."))
(EXPORT '*INLINE-QUERY-RESULT-CACHED-DOCUMENT)

(DEFCLASS *INLINE-QUERY-RESULT-CACHED-VIDEO NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultCachedVideo")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be video")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (VIDEO--FILE--ID :INITARG :VIDEO--FILE--ID :INITFORM NIL :ACCESSOR
            TG-VIDEO--FILE--ID :TYPE STRING :DOCUMENTATION
            "A valid file identifier for the video file")
           (TITLE :INITARG :TITLE :INITFORM NIL :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title for the result")
           (DESCRIPTION :INITARG :DESCRIPTION :ACCESSOR TG-DESCRIPTION :TYPE
            STRING :DOCUMENTATION "Short description of the result")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION
            "Caption of the video to be sent, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the video"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultcachedvideo
Represents a link to a video file stored on the Telegram servers. By default, this video file will be sent by the user with an optional caption. Alternatively, you can use input_message_content to send a message with the specified content instead of the video."))
(EXPORT '*INLINE-QUERY-RESULT-CACHED-VIDEO)

(DEFCLASS *INLINE-QUERY-RESULT-CACHED-VOICE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultCachedVoice")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be voice")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (VOICE--FILE--ID :INITARG :VOICE--FILE--ID :INITFORM NIL :ACCESSOR
            TG-VOICE--FILE--ID :TYPE STRING :DOCUMENTATION
            "A valid file identifier for the voice message")
           (TITLE :INITARG :TITLE :INITFORM NIL :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Voice message title")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION "Caption, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the voice message"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultcachedvoice
Represents a link to a voice message stored on the Telegram servers. By default, this voice message will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the voice message."))
(EXPORT '*INLINE-QUERY-RESULT-CACHED-VOICE)

(DEFCLASS *INLINE-QUERY-RESULT-CACHED-AUDIO NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InlineQueryResultCachedAudio")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION "Type of the result, must be audio")
           (ID :INITARG :ID :INITFORM NIL :ACCESSOR TG-ID :TYPE STRING
            :DOCUMENTATION "Unique identifier for this result, 1-64 bytes")
           (AUDIO--FILE--ID :INITARG :AUDIO--FILE--ID :INITFORM NIL :ACCESSOR
            TG-AUDIO--FILE--ID :TYPE STRING :DOCUMENTATION
            "A valid file identifier for the audio file")
           (CAPTION :INITARG :CAPTION :ACCESSOR TG-CAPTION :TYPE STRING
            :DOCUMENTATION "Caption, 0-1024 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in the media caption.")
           (REPLY--MARKUP :INITARG :REPLY--MARKUP :ACCESSOR TG-REPLY--MARKUP
            :TYPE *INLINE-KEYBOARD-MARKUP :DOCUMENTATION
            "Inline keyboard attached to the message")
           (INPUT--MESSAGE--CONTENT :INITARG :INPUT--MESSAGE--CONTENT :ACCESSOR
            TG-INPUT--MESSAGE--CONTENT :TYPE *INPUT-MESSAGE-CONTENT
            :DOCUMENTATION
            "Content of the message to be sent instead of the audio"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inlinequeryresultcachedaudio
Represents a link to an mp3 audio file stored on the Telegram servers. By default, this audio file will be sent by the user. Alternatively, you can use input_message_content to send a message with the specified content instead of the audio."))
(EXPORT '*INLINE-QUERY-RESULT-CACHED-AUDIO)

(DEFUN *INPUT-MESSAGE-CONTENT ()
  "https://core.telegram.org/bots/api#inputmessagecontent
This object represents the content of a message to be sent as a result of an inline query. Telegram clients currently support the following 4 types:"
  (LET ((OPTIONS (LIST)))
    (LIST "InputMessageContent" OPTIONS)))
(EXPORT '*INPUT-MESSAGE-CONTENT)

(DEFCLASS *INPUT-TEXT-MESSAGE-CONTENT NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InputTextMessageContent")
           (MESSAGE--TEXT :INITARG :MESSAGE--TEXT :INITFORM NIL :ACCESSOR
            TG-MESSAGE--TEXT :TYPE STRING :DOCUMENTATION
            "Text of the message to be sent, 1-4096 characters")
           (PARSE--MODE :INITARG :PARSE--MODE :ACCESSOR TG-PARSE--MODE :TYPE
            STRING :DOCUMENTATION
            "Send Markdown or HTML, if you want Telegram apps to show bold, italic, fixed-width text or inline URLs in your bot's message.")
           (DISABLE--WEB--PAGE--PREVIEW :INITARG :DISABLE--WEB--PAGE--PREVIEW
            :ACCESSOR TG-DISABLE--WEB--PAGE--PREVIEW :TYPE BOOLEAN
            :DOCUMENTATION
            "Disables link previews for links in the sent message"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inputtextmessagecontent
Represents the content of a text message to be sent as the result of an inline query."))
(EXPORT '*INPUT-TEXT-MESSAGE-CONTENT)

(DEFCLASS *INPUT-LOCATION-MESSAGE-CONTENT NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InputLocationMessageContent")
           (LATITUDE :INITARG :LATITUDE :INITFORM NIL :ACCESSOR TG-LATITUDE
            :TYPE *FLOAT :DOCUMENTATION "Latitude of the location in degrees")
           (LONGITUDE :INITARG :LONGITUDE :INITFORM NIL :ACCESSOR TG-LONGITUDE
            :TYPE *FLOAT :DOCUMENTATION "Longitude of the location in degrees")
           (LIVE--PERIOD :INITARG :LIVE--PERIOD :ACCESSOR TG-LIVE--PERIOD :TYPE
            INTEGER :DOCUMENTATION
            "Period in seconds for which the location can be updated, should be between 60 and 86400."))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inputlocationmessagecontent
Represents the content of a location message to be sent as the result of an inline query."))
(EXPORT '*INPUT-LOCATION-MESSAGE-CONTENT)

(DEFCLASS *INPUT-VENUE-MESSAGE-CONTENT NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InputVenueMessageContent")
           (LATITUDE :INITARG :LATITUDE :INITFORM NIL :ACCESSOR TG-LATITUDE
            :TYPE *FLOAT :DOCUMENTATION "Latitude of the venue in degrees")
           (LONGITUDE :INITARG :LONGITUDE :INITFORM NIL :ACCESSOR TG-LONGITUDE
            :TYPE *FLOAT :DOCUMENTATION "Longitude of the venue in degrees")
           (TITLE :INITARG :TITLE :INITFORM NIL :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Name of the venue")
           (ADDRESS :INITARG :ADDRESS :INITFORM NIL :ACCESSOR TG-ADDRESS :TYPE
            STRING :DOCUMENTATION "Address of the venue")
           (FOURSQUARE--ID :INITARG :FOURSQUARE--ID :ACCESSOR TG-FOURSQUARE--ID
            :TYPE STRING :DOCUMENTATION
            "Foursquare identifier of the venue, if known")
           (FOURSQUARE--TYPE :INITARG :FOURSQUARE--TYPE :ACCESSOR
            TG-FOURSQUARE--TYPE :TYPE STRING :DOCUMENTATION
            "Foursquare type of the venue, if known. (For example, “arts_entertainment/default”, “arts_entertainment/aquarium” or “food/icecream”.)"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inputvenuemessagecontent
Represents the content of a venue message to be sent as the result of an inline query."))
(EXPORT '*INPUT-VENUE-MESSAGE-CONTENT)

(DEFCLASS *INPUT-CONTACT-MESSAGE-CONTENT NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "InputContactMessageContent")
           (PHONE--NUMBER :INITARG :PHONE--NUMBER :INITFORM NIL :ACCESSOR
            TG-PHONE--NUMBER :TYPE STRING :DOCUMENTATION
            "Contact's phone number")
           (FIRST--NAME :INITARG :FIRST--NAME :INITFORM NIL :ACCESSOR
            TG-FIRST--NAME :TYPE STRING :DOCUMENTATION "Contact's first name")
           (LAST--NAME :INITARG :LAST--NAME :ACCESSOR TG-LAST--NAME :TYPE
            STRING :DOCUMENTATION "Contact's last name")
           (VCARD :INITARG :VCARD :ACCESSOR TG-VCARD :TYPE STRING
            :DOCUMENTATION
            "Additional data about the contact in the form of a vCard, 0-2048 bytes"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#inputcontactmessagecontent
Represents the content of a contact message to be sent as the result of an inline query."))
(EXPORT '*INPUT-CONTACT-MESSAGE-CONTENT)

(DEFCLASS *CHOSEN-INLINE-RESULT NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "ChosenInlineResult")
           (RESULT--ID :INITARG :RESULT--ID :INITFORM NIL :ACCESSOR
            TG-RESULT--ID :TYPE STRING :DOCUMENTATION
            "The unique identifier for the result that was chosen")
           (FROM :INITARG :FROM :INITFORM NIL :ACCESSOR TG-FROM :TYPE *USER
            :DOCUMENTATION "The user that chose the result")
           (LOCATION :INITARG :LOCATION :ACCESSOR TG-LOCATION :TYPE *LOCATION
            :DOCUMENTATION
            "Sender location, only for bots that require user location")
           (INLINE--MESSAGE--ID :INITARG :INLINE--MESSAGE--ID :ACCESSOR
            TG-INLINE--MESSAGE--ID :TYPE STRING :DOCUMENTATION
            "Identifier of the sent inline message. Available only if there is an inline keyboard attached to the message. Will be also received in callback queries and can be used to edit the message.")
           (QUERY :INITARG :QUERY :INITFORM NIL :ACCESSOR TG-QUERY :TYPE STRING
            :DOCUMENTATION "The query that was used to obtain the result"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#choseninlineresult
Represents a result of an inline query that was chosen by the user and sent to their chat partner."))
(EXPORT '*CHOSEN-INLINE-RESULT)


;----Telegram Passport----
(DEFCLASS *PASSPORT-DATA NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "PassportData")
           (DATA :INITARG :DATA :INITFORM NIL :ACCESSOR TG-DATA :TYPE
            (ARRAY *ENCRYPTED-PASSPORT-ELEMENT) :DOCUMENTATION
            "Array with information about documents and other Telegram Passport elements that was shared with the bot")
           (CREDENTIALS :INITARG :CREDENTIALS :INITFORM NIL :ACCESSOR
            TG-CREDENTIALS :TYPE *ENCRYPTED-CREDENTIALS :DOCUMENTATION
            "Encrypted credentials required to decrypt the data"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#passportdata
Contains information about Telegram Passport data shared with the bot by the user."))
(EXPORT '*PASSPORT-DATA)

(DEFCLASS *PASSPORT-FILE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "PassportFile")
           (FILE--ID :INITARG :FILE--ID :INITFORM NIL :ACCESSOR TG-FILE--ID
            :TYPE STRING :DOCUMENTATION "Identifier for this file")
           (FILE--SIZE :INITARG :FILE--SIZE :INITFORM NIL :ACCESSOR
            TG-FILE--SIZE :TYPE INTEGER :DOCUMENTATION "File size")
           (FILE--DATE :INITARG :FILE--DATE :INITFORM NIL :ACCESSOR
            TG-FILE--DATE :TYPE INTEGER :DOCUMENTATION
            "Unix time when the file was uploaded"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#passportfile
This object represents a file uploaded to Telegram Passport. Currently all Telegram Passport files are in JPEG format when decrypted and don't exceed 10MB."))
(EXPORT '*PASSPORT-FILE)

(DEFCLASS *ENCRYPTED-PASSPORT-ELEMENT NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "EncryptedPassportElement")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION
            "Element type. One of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”, “phone_number”, “email”.")
           (DATA :INITARG :DATA :ACCESSOR TG-DATA :TYPE STRING :DOCUMENTATION
            "Base64-encoded encrypted Telegram Passport element data provided by the user, available for “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport” and “address” types. Can be decrypted and verified using the accompanying EncryptedCredentials.")
           (PHONE--NUMBER :INITARG :PHONE--NUMBER :ACCESSOR TG-PHONE--NUMBER
            :TYPE STRING :DOCUMENTATION
            "User's verified phone number, available only for “phone_number” type")
           (EMAIL :INITARG :EMAIL :ACCESSOR TG-EMAIL :TYPE STRING
            :DOCUMENTATION
            "User's verified email address, available only for “email” type")
           (FILES :INITARG :FILES :ACCESSOR TG-FILES :TYPE
            (ARRAY *PASSPORT-FILE) :DOCUMENTATION
            "Array of encrypted files with documents provided by the user, available for “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials.")
           (FRONT--SIDE :INITARG :FRONT--SIDE :ACCESSOR TG-FRONT--SIDE :TYPE
            *PASSPORT-FILE :DOCUMENTATION
            "Encrypted file with the front side of the document, provided by the user. Available for “passport”, “driver_license”, “identity_card” and “internal_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials.")
           (REVERSE--SIDE :INITARG :REVERSE--SIDE :ACCESSOR TG-REVERSE--SIDE
            :TYPE *PASSPORT-FILE :DOCUMENTATION
            "Encrypted file with the reverse side of the document, provided by the user. Available for “driver_license” and “identity_card”. The file can be decrypted and verified using the accompanying EncryptedCredentials.")
           (SELFIE :INITARG :SELFIE :ACCESSOR TG-SELFIE :TYPE *PASSPORT-FILE
            :DOCUMENTATION
            "Encrypted file with the selfie of the user holding a document, provided by the user; available for “passport”, “driver_license”, “identity_card” and “internal_passport”. The file can be decrypted and verified using the accompanying EncryptedCredentials.")
           (TRANSLATION :INITARG :TRANSLATION :ACCESSOR TG-TRANSLATION :TYPE
            (ARRAY *PASSPORT-FILE) :DOCUMENTATION
            "Array of encrypted files with translated versions of documents provided by the user. Available if requested for “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration” and “temporary_registration” types. Files can be decrypted and verified using the accompanying EncryptedCredentials.")
           (HASH :INITARG :HASH :INITFORM NIL :ACCESSOR TG-HASH :TYPE STRING
            :DOCUMENTATION
            "Base64-encoded element hash for using in PassportElementErrorUnspecified"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#encryptedpassportelement
Contains information about documents or other Telegram Passport elements shared with the bot by the user."))
(EXPORT '*ENCRYPTED-PASSPORT-ELEMENT)

(DEFCLASS *ENCRYPTED-CREDENTIALS NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "EncryptedCredentials")
           (DATA :INITARG :DATA :INITFORM NIL :ACCESSOR TG-DATA :TYPE STRING
            :DOCUMENTATION
            "Base64-encoded encrypted JSON-serialized data with unique user's payload, data hashes and secrets required for EncryptedPassportElement decryption and authentication")
           (HASH :INITARG :HASH :INITFORM NIL :ACCESSOR TG-HASH :TYPE STRING
            :DOCUMENTATION "Base64-encoded data hash for data authentication")
           (SECRET :INITARG :SECRET :INITFORM NIL :ACCESSOR TG-SECRET :TYPE
            STRING :DOCUMENTATION
            "Base64-encoded secret, encrypted with the bot's public RSA key, required for data decryption"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#encryptedcredentials
Contains data required for decrypting and authenticating EncryptedPassportElement. See the Telegram Passport Documentation for a complete description of the data decryption and authentication processes."))
(EXPORT '*ENCRYPTED-CREDENTIALS)

(DEFUN SET-PASSPORT-DATA-ERRORS (USER--ID ERRORS)
  "https://core.telegram.org/bots/api#setpassportdataerrors
Informs a user that some of the Telegram Passport elements they provided contains errors. The user will not be able to re-submit their Passport to you until the errors are fixed (the contents of the field for which you returned the error must change). Returns True on success."
  (CHECK-TYPE USER--ID INTEGER)
  (CHECK-TYPE ERRORS (ARRAY *PASSPORT-ELEMENT-ERROR))
  (LET ((OPTIONS (LIST (CONS :USER_ID USER--ID) (CONS :ERRORS ERRORS))))
    (LIST "setPassportDataErrors" OPTIONS)))
(EXPORT 'SET-PASSPORT-DATA-ERRORS)

(DEFUN *PASSPORT-ELEMENT-ERROR ()
  "https://core.telegram.org/bots/api#passportelementerror
This object represents an error in the Telegram Passport element which was submitted that should be resolved by the user. It should be one of:"
  (LET ((OPTIONS (LIST)))
    (LIST "PassportElementError" OPTIONS)))
(EXPORT '*PASSPORT-ELEMENT-ERROR)

(DEFCLASS *PASSPORT-ELEMENT-ERROR-DATA-FIELD NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "PassportElementErrorDataField")
           (SOURCE :INITARG :SOURCE :INITFORM NIL :ACCESSOR TG-SOURCE :TYPE
            STRING :DOCUMENTATION "Error source, must be data")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION
            "The section of the user's Telegram Passport which has the error, one of “personal_details”, “passport”, “driver_license”, “identity_card”, “internal_passport”, “address”")
           (FIELD--NAME :INITARG :FIELD--NAME :INITFORM NIL :ACCESSOR
            TG-FIELD--NAME :TYPE STRING :DOCUMENTATION
            "Name of the data field which has the error")
           (DATA--HASH :INITARG :DATA--HASH :INITFORM NIL :ACCESSOR
            TG-DATA--HASH :TYPE STRING :DOCUMENTATION
            "Base64-encoded data hash")
           (MESSAGE :INITARG :MESSAGE :INITFORM NIL :ACCESSOR TG-MESSAGE :TYPE
            STRING :DOCUMENTATION "Error message"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#passportelementerrordatafield
Represents an issue in one of the data fields that was provided by the user. The error is considered resolved when the field's value changes."))
(EXPORT '*PASSPORT-ELEMENT-ERROR-DATA-FIELD)

(DEFCLASS *PASSPORT-ELEMENT-ERROR-FRONT-SIDE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "PassportElementErrorFrontSide")
           (SOURCE :INITARG :SOURCE :INITFORM NIL :ACCESSOR TG-SOURCE :TYPE
            STRING :DOCUMENTATION "Error source, must be front_side")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION
            "The section of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”")
           (FILE--HASH :INITARG :FILE--HASH :INITFORM NIL :ACCESSOR
            TG-FILE--HASH :TYPE STRING :DOCUMENTATION
            "Base64-encoded hash of the file with the front side of the document")
           (MESSAGE :INITARG :MESSAGE :INITFORM NIL :ACCESSOR TG-MESSAGE :TYPE
            STRING :DOCUMENTATION "Error message"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#passportelementerrorfrontside
Represents an issue with the front side of a document. The error is considered resolved when the file with the front side of the document changes."))
(EXPORT '*PASSPORT-ELEMENT-ERROR-FRONT-SIDE)

(DEFCLASS *PASSPORT-ELEMENT-ERROR-REVERSE-SIDE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "PassportElementErrorReverseSide")
           (SOURCE :INITARG :SOURCE :INITFORM NIL :ACCESSOR TG-SOURCE :TYPE
            STRING :DOCUMENTATION "Error source, must be reverse_side")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION
            "The section of the user's Telegram Passport which has the issue, one of “driver_license”, “identity_card”")
           (FILE--HASH :INITARG :FILE--HASH :INITFORM NIL :ACCESSOR
            TG-FILE--HASH :TYPE STRING :DOCUMENTATION
            "Base64-encoded hash of the file with the reverse side of the document")
           (MESSAGE :INITARG :MESSAGE :INITFORM NIL :ACCESSOR TG-MESSAGE :TYPE
            STRING :DOCUMENTATION "Error message"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#passportelementerrorreverseside
Represents an issue with the reverse side of a document. The error is considered resolved when the file with reverse side of the document changes."))
(EXPORT '*PASSPORT-ELEMENT-ERROR-REVERSE-SIDE)

(DEFCLASS *PASSPORT-ELEMENT-ERROR-SELFIE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "PassportElementErrorSelfie")
           (SOURCE :INITARG :SOURCE :INITFORM NIL :ACCESSOR TG-SOURCE :TYPE
            STRING :DOCUMENTATION "Error source, must be selfie")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION
            "The section of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”")
           (FILE--HASH :INITARG :FILE--HASH :INITFORM NIL :ACCESSOR
            TG-FILE--HASH :TYPE STRING :DOCUMENTATION
            "Base64-encoded hash of the file with the selfie")
           (MESSAGE :INITARG :MESSAGE :INITFORM NIL :ACCESSOR TG-MESSAGE :TYPE
            STRING :DOCUMENTATION "Error message"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#passportelementerrorselfie
Represents an issue with the selfie with a document. The error is considered resolved when the file with the selfie changes."))
(EXPORT '*PASSPORT-ELEMENT-ERROR-SELFIE)

(DEFCLASS *PASSPORT-ELEMENT-ERROR-FILE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "PassportElementErrorFile")
           (SOURCE :INITARG :SOURCE :INITFORM NIL :ACCESSOR TG-SOURCE :TYPE
            STRING :DOCUMENTATION "Error source, must be file")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION
            "The section of the user's Telegram Passport which has the issue, one of “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”")
           (FILE--HASH :INITARG :FILE--HASH :INITFORM NIL :ACCESSOR
            TG-FILE--HASH :TYPE STRING :DOCUMENTATION
            "Base64-encoded file hash")
           (MESSAGE :INITARG :MESSAGE :INITFORM NIL :ACCESSOR TG-MESSAGE :TYPE
            STRING :DOCUMENTATION "Error message"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#passportelementerrorfile
Represents an issue with a document scan. The error is considered resolved when the file with the document scan changes."))
(EXPORT '*PASSPORT-ELEMENT-ERROR-FILE)

(DEFCLASS *PASSPORT-ELEMENT-ERROR-FILES NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "PassportElementErrorFiles")
           (SOURCE :INITARG :SOURCE :INITFORM NIL :ACCESSOR TG-SOURCE :TYPE
            STRING :DOCUMENTATION "Error source, must be files")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION
            "The section of the user's Telegram Passport which has the issue, one of “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”")
           (FILE--HASHES :INITARG :FILE--HASHES :INITFORM NIL :ACCESSOR
            TG-FILE--HASHES :TYPE (ARRAY STRING) :DOCUMENTATION
            "List of base64-encoded file hashes")
           (MESSAGE :INITARG :MESSAGE :INITFORM NIL :ACCESSOR TG-MESSAGE :TYPE
            STRING :DOCUMENTATION "Error message"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#passportelementerrorfiles
Represents an issue with a list of scans. The error is considered resolved when the list of files containing the scans changes."))
(EXPORT '*PASSPORT-ELEMENT-ERROR-FILES)

(DEFCLASS *PASSPORT-ELEMENT-ERROR-TRANSLATION-FILE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "PassportElementErrorTranslationFile")
           (SOURCE :INITARG :SOURCE :INITFORM NIL :ACCESSOR TG-SOURCE :TYPE
            STRING :DOCUMENTATION "Error source, must be translation_file")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION
            "Type of element of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”")
           (FILE--HASH :INITARG :FILE--HASH :INITFORM NIL :ACCESSOR
            TG-FILE--HASH :TYPE STRING :DOCUMENTATION
            "Base64-encoded file hash")
           (MESSAGE :INITARG :MESSAGE :INITFORM NIL :ACCESSOR TG-MESSAGE :TYPE
            STRING :DOCUMENTATION "Error message"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#passportelementerrortranslationfile
Represents an issue with one of the files that constitute the translation of a document. The error is considered resolved when the file changes."))
(EXPORT '*PASSPORT-ELEMENT-ERROR-TRANSLATION-FILE)

(DEFCLASS *PASSPORT-ELEMENT-ERROR-TRANSLATION-FILES NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "PassportElementErrorTranslationFiles")
           (SOURCE :INITARG :SOURCE :INITFORM NIL :ACCESSOR TG-SOURCE :TYPE
            STRING :DOCUMENTATION "Error source, must be translation_files")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION
            "Type of element of the user's Telegram Passport which has the issue, one of “passport”, “driver_license”, “identity_card”, “internal_passport”, “utility_bill”, “bank_statement”, “rental_agreement”, “passport_registration”, “temporary_registration”")
           (FILE--HASHES :INITARG :FILE--HASHES :INITFORM NIL :ACCESSOR
            TG-FILE--HASHES :TYPE (ARRAY STRING) :DOCUMENTATION
            "List of base64-encoded file hashes")
           (MESSAGE :INITARG :MESSAGE :INITFORM NIL :ACCESSOR TG-MESSAGE :TYPE
            STRING :DOCUMENTATION "Error message"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#passportelementerrortranslationfiles
Represents an issue with the translated version of a document. The error is considered resolved when a file with the document translation change."))
(EXPORT '*PASSPORT-ELEMENT-ERROR-TRANSLATION-FILES)

(DEFCLASS *PASSPORT-ELEMENT-ERROR-UNSPECIFIED NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "PassportElementErrorUnspecified")
           (SOURCE :INITARG :SOURCE :INITFORM NIL :ACCESSOR TG-SOURCE :TYPE
            STRING :DOCUMENTATION "Error source, must be unspecified")
           (TYPE :INITARG :TYPE :INITFORM NIL :ACCESSOR TG-TYPE :TYPE STRING
            :DOCUMENTATION
            "Type of element of the user's Telegram Passport which has the issue")
           (ELEMENT--HASH :INITARG :ELEMENT--HASH :INITFORM NIL :ACCESSOR
            TG-ELEMENT--HASH :TYPE STRING :DOCUMENTATION
            "Base64-encoded element hash")
           (MESSAGE :INITARG :MESSAGE :INITFORM NIL :ACCESSOR TG-MESSAGE :TYPE
            STRING :DOCUMENTATION "Error message"))
          (:DOCUMENTATION
           "https://core.telegram.org/bots/api#passportelementerrorunspecified
Represents an issue in an unspecified place. The error is considered resolved when new data is added."))
(EXPORT '*PASSPORT-ELEMENT-ERROR-UNSPECIFIED)


;----Games----
(DEFUN SEND-GAME
       (CHAT--ID GAME--SHORT--NAME
        &KEY DISABLE--NOTIFICATION REPLY--TO--MESSAGE--ID REPLY--MARKUP)
  "https://core.telegram.org/bots/api#sendgame
Use this method to send a game. On success, the sent Message is returned."
  (CHECK-TYPE CHAT--ID INTEGER)
  (CHECK-TYPE GAME--SHORT--NAME STRING)
  (LET ((OPTIONS
         (LIST (CONS :CHAT_ID CHAT--ID)
               (CONS :GAME_SHORT_NAME GAME--SHORT--NAME))))
    (WHEN DISABLE--NOTIFICATION
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_NOTIFICATION DISABLE--NOTIFICATION)))))
    (WHEN REPLY--TO--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :REPLY_TO_MESSAGE_ID REPLY--TO--MESSAGE--ID)))))
    (WHEN REPLY--MARKUP
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :REPLY_MARKUP REPLY--MARKUP)))))
    (LIST "sendGame" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SEND-GAME)

(DEFCLASS *GAME NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM "Game")
           (TITLE :INITARG :TITLE :INITFORM NIL :ACCESSOR TG-TITLE :TYPE STRING
            :DOCUMENTATION "Title of the game")
           (DESCRIPTION :INITARG :DESCRIPTION :INITFORM NIL :ACCESSOR
            TG-DESCRIPTION :TYPE STRING :DOCUMENTATION
            "Description of the game")
           (PHOTO :INITARG :PHOTO :INITFORM NIL :ACCESSOR TG-PHOTO :TYPE
            (ARRAY *PHOTO-SIZE) :DOCUMENTATION
            "Photo that will be displayed in the game message in chats.")
           (TEXT :INITARG :TEXT :ACCESSOR TG-TEXT :TYPE STRING :DOCUMENTATION
            "Brief description of the game or high scores included in the game message. Can be automatically edited to include current high scores for the game when the bot calls setGameScore, or manually edited using editMessageText. 0-4096 characters.")
           (TEXT--ENTITIES :INITARG :TEXT--ENTITIES :ACCESSOR TG-TEXT--ENTITIES
            :TYPE (ARRAY *MESSAGE-ENTITY) :DOCUMENTATION
            "Special entities that appear in text, such as usernames, URLs, bot commands, etc.")
           (ANIMATION :INITARG :ANIMATION :ACCESSOR TG-ANIMATION :TYPE
            *ANIMATION :DOCUMENTATION
            "Animation that will be displayed in the game message in chats. Upload via BotFather"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#game
This object represents a game. Use BotFather to create and edit games, their short names will act as unique identifiers."))
(EXPORT '*GAME)

(DEFUN SET-GAME-SCORE
       (USER--ID SCORE
        &KEY FORCE DISABLE--EDIT--MESSAGE CHAT--ID MESSAGE--ID
        INLINE--MESSAGE--ID)
  "https://core.telegram.org/bots/api#setgamescore
Use this method to set the score of the specified user in a game. On success, if the message was sent by the bot, returns the edited Message, otherwise returns True. Returns an error, if the new score is not greater than the user's current score in the chat and force is False."
  (CHECK-TYPE USER--ID INTEGER)
  (CHECK-TYPE SCORE INTEGER)
  (LET ((OPTIONS (LIST (CONS :USER_ID USER--ID) (CONS :SCORE SCORE))))
    (WHEN FORCE (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :FORCE FORCE)))))
    (WHEN DISABLE--EDIT--MESSAGE
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST
                      (CONS :DISABLE_EDIT_MESSAGE DISABLE--EDIT--MESSAGE)))))
    (WHEN CHAT--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CHAT_ID CHAT--ID)))))
    (WHEN MESSAGE--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :MESSAGE_ID MESSAGE--ID)))))
    (WHEN INLINE--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST (CONS :INLINE_MESSAGE_ID INLINE--MESSAGE--ID)))))
    (LIST "setGameScore" OPTIONS :RETURN-TYPE '*MESSAGE)))
(EXPORT 'SET-GAME-SCORE)

(DEFUN GET-GAME-HIGH-SCORES
       (USER--ID &KEY CHAT--ID MESSAGE--ID INLINE--MESSAGE--ID)
  "https://core.telegram.org/bots/api#getgamehighscores
Use this method to get data for high score tables. Will return the score of the specified user and several of his neighbors in a game. On success, returns an Array of GameHighScore objects."
  (CHECK-TYPE USER--ID INTEGER)
  (LET ((OPTIONS (LIST (CONS :USER_ID USER--ID))))
    (WHEN CHAT--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :CHAT_ID CHAT--ID)))))
    (WHEN MESSAGE--ID
      (SETF OPTIONS (NCONC OPTIONS (LIST (CONS :MESSAGE_ID MESSAGE--ID)))))
    (WHEN INLINE--MESSAGE--ID
      (SETF OPTIONS
              (NCONC OPTIONS
                     (LIST (CONS :INLINE_MESSAGE_ID INLINE--MESSAGE--ID)))))
    (LIST "getGameHighScores" OPTIONS)))
(EXPORT 'GET-GAME-HIGH-SCORES)

(DEFCLASS *GAME-HIGH-SCORE NIL
          ((TYPE-NAME :ALLOCATION :CLASS :READER NAME :INITFORM
            "GameHighScore")
           (POSITION :INITARG :POSITION :INITFORM NIL :ACCESSOR TG-POSITION
                     :TYPE INTEGER :DOCUMENTATION
                     "Position in high score table for the game")
           (USER :INITARG :USER :INITFORM NIL :ACCESSOR TG-USER :TYPE *USER
            :DOCUMENTATION "User")
           (SCORE :INITARG :SCORE :INITFORM NIL :ACCESSOR TG-SCORE :TYPE
            INTEGER :DOCUMENTATION "Score"))
          (:DOCUMENTATION "https://core.telegram.org/bots/api#gamehighscore
This object represents one row of the high scores table for a game."))
(EXPORT '*GAME-HIGH-SCORE)

