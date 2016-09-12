(require 'go-mode)

(add-hook 'before-save-hook 'gofmt-before-save)


(add-hook 'go-mode-hook
  (lambda ()
    (local-set-key (kbd "C-c C-i") 'go-remove-unused-imports)
    (setq tab-width 4)
    (flycheck-mode-if-not-remote)))

(provide 'setup-go)
