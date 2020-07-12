(use-package exec-path-from-shell)

(use-package eglot
  :defer t
  ;; workaround for some versioning issues
  ;; https://github.com/raxod502/straight.el/issues/531
  ;; https://github.com/hlissner/doom-emacs/issues/3269
  :init (defun project-root (project)
          (car (project-roots project)))
  ;; we use exec path from shell here so we can find installed lsp servers
  :config (when window-system
            (exec-path-from-shell-initialize)))

(use-package flymake
  :straight (:type built-in))

;; not stricltly eglot but makes its flymake integration much more useful
(use-package flymake-diagnostic-at-point
  :after flymake
  :config
  (add-hook 'flymake-mode-hook #'flymake-diagnostic-at-point-mode))

(provide 'setup-eglot)
