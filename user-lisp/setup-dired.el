;; Make dired less verbose
(require 'dired-details)
(setq-default dired-details-hidden-string "-> ")
(dired-details-install)
(put 'dired-find-alternate-file 'disabled nil)

(provide 'setup-dired)
