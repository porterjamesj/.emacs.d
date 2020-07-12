;; defaults.el
;; Reasonable default settings for emacs
;; also some little configuration for built in packages (e.g. tramp)

;; no-littering tries to collect all the random config files that
;; various emacs packages (and emacs itself) create into two
;; directories: .emacs.d/var and .emacs.d/etc
(use-package no-littering
  :config
  (setq custom-file (no-littering-expand-etc-file-name "custom.el")))

(use-package tramp
  :defer t
  :straight (:type built-in)
  :custom
  (tramp-default-method "ssh"))

;; disable backup, autosave, and lockfiles
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq create-lockfiles nil)

;; Don't play annoying bell noise
(setq ring-bell-function #'ignore)

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; don't ask about following symlinks
(setq vc-follow-symlinks t)

;; prevent things like find-file from ever using os windows
(setq use-dialog-box nil)

;; Always display line and column numbers
(setq line-number-mode t)
(setq column-number-mode t)

;; Shorter scratch message
(setq initial-scratch-message ";; scratch")

;; fix tabs indenting
(setq-default indent-tabs-mode nil)

;; show matching parens
(show-paren-mode 1)

;; TODO try smartparens; electric pair has some behavior with quotes
;; that I find not great
;;
;; match them automatically
(electric-pair-mode 1)

;; automatically delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; enable hide-show mode in prog-modes
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; allow upcase and downcase region
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; highlight the current line
(global-hl-line-mode)

;; never open new frames in coca
(setq ns-pop-up-frames nil)

(provide 'defaults)
