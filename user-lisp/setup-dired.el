;; Make dired less verbose
(add-hook 'dired-mode-hook
      (lambda ()
        (dired-hide-details-mode)))

(put 'dired-find-alternate-file 'disabled nil)

;; reuse the buffer
(require 'dired) 
(define-key dired-mode-map (kbd "<return>") 'dired-find-alternate-file)

(provide 'setup-dired)
