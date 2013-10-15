;; Make dired less verbose
(require 'dired-details)
(setq-default dired-details-hidden-string "-> ")
(dired-details-install)
(put 'dired-find-alternate-file 'disabled nil)

;; reuse the buffer
(require 'dired)
(define-key dired-mode-map (kbd "<return>") 'dired-find-alternate-file)

(provide 'setup-dired)
