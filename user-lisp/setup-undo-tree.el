(global-undo-tree-mode)

;; gross hack because undo-tree overrides this binding there's
;; probably a much better way to do this without having to put this
;; line in this file but oh well
(global-set-key (kbd "M-_") 'insert-m-dash)

(provide 'setup-undo-tree)
