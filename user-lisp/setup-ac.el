(require 'auto-complete)
(global-auto-complete-mode t)

(require 'auto-complete-config)
(ac-config-default)

;; fix flyspell mode
(add-hook 'flyspell-mode-hook
          (lambda () (ac-flyspell-workaround)))

;; ac-ispell

;; Completion words longer than 4 characters
;; (custom-set-variables
;;   '(ac-ispell-requires 4))

;; (eval-after-load "auto-complete"
;;   '(progn
;;       (ac-ispell-setup)
;;       (setq ac-sources (cons 'ac-source-words-in-same-mode-buffers ac-sources))))

;; (add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
;; (add-hook 'markdown-mode-hook 'ac-ispell-ac-setup)

(provide 'setup-ac)
