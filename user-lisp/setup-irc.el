;; load passwords
(require 'secrets)

(require 'erc-services)
(erc-services-mode 1)
(setq erc-prompt-for-nickserv-password nil)

;; nick highlighting (!)
(require 'erc-hl-nicks)

;; hide boring messages
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

;; This stuff is from PuercoPop:
;; Kill buffers for channels after /part
(setq erc-kill-buffer-on-part t)
;; Kill buffers for private queries after quitting the server
(setq erc-kill-queries-on-quit t)
;; Kill buffers for server messages after quitting the server
(setq erc-kill-server-buffer-on-quit t)

;; don't attempt to autojoin channels before we've
;; identified ourselves
(setq erc-autojoin-timing 'ident)

;; configure freenode password
(setq erc-nickserv-passwords
      `((freenode (("jamesjporter" . ,freenode-jamesjporter-password)))))

;; autojoin appropriate channels
(setq erc-autojoin-channels-alist
      `((".*\\.freenode.net" "#emacs" "#python" "#julia" "#hackerschool")
        (".*\\.bionimbus.org" "#lac")))

;; channel specific prompts
;; from the wiki: http://www.emacswiki.org/emacs/ErcConfiguration#toc5
(setq erc-prompt (lambda ()
     (if (and (boundp 'erc-default-recipients) (erc-default-target))
         (erc-propertize (concat (erc-default-target) ">") 'read-only t 'rear-nonsticky t 'front-nonsticky t)
       (erc-propertize (concat "ERC>") 'read-only t 'rear-nonsticky t 'front-nonsticky t))))

;; launch freenode command
(defun erc-launch-freenode ()
  (interactive)
  (erc
   :server "irc.freenode.net"
   :port 6667
   :nick "jamesjporter"
   :fullname "James J Porter"))

;; lac stuff
;; launch lac command
(defun erc-launch-lac ()
  (interactive)
  (erc-tls
   :server "irc.bionimbus.org"
   :port 9010
   :nick "james"
   :password osdc-server-password))

(provide 'setup-irc)
