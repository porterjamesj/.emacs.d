;; defaults.el
;; Reasonable default settings for emacs

;; disable backup, autosave, and lockfiles
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; Don't play annoying bell noise
(setq ring-bell-function #'ignore)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Shorter scratch message
(setq initial-scratch-message ";; scratch")

;; fix tabs indenting
(setq-default indent-tabs-mode nil)

;; show matching parens
(show-paren-mode 1)

;; setup whitespace mode
(custom-set-variables
  '(whitespace-line-column 80)
  '(whitespace-style '(face trailing tabs lines-tail)))

;; automatically delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; allow upcase and downcase region
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; highlight the current line
(global-hl-line-mode)

(provide 'defaults)
