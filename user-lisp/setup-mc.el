(require 'multiple-cursors)

(add-to-list 'mc/unsupported-minor-modes 'smartparens-mode)

;; multiple cursors
(global-set-key (kbd "C-'") 'mc/mark-next-like-this)
(global-set-key (kbd "C-\"") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-;") 'mc/mark-all-like-this)


(provide 'setup-mc)
