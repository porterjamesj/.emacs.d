;; Make startup faster by reducing the frequency of garbage
;; collection.  The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))


;; Resizing the Emacs frame can be a terribly expensive part of changing the
;; font. By inhibiting this, we easily halve startup times with fonts that are
;; larger than the system default.
(setq frame-inhibit-implied-resize t)

;; No splash screen
(setq inhibit-startup-message t)

;; Resizing the Emacs frame can be a terribly expensive part of changing the
;; font. By inhibiting this, we easily halve startup times with fonts that are
;; larger than the system default.
(setq frame-inhibit-implied-resize t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; put user-lisp directory on load-path
(add-to-list 'load-path "~/.emacs.d/user-lisp")

;; add use-package
(straight-use-package 'use-package)

;; make use-package install things with straight by default
;; TODO go back and remove :straight t from all the declarations where its not needed anymore
(setq straight-use-package-by-default t)

;; install utility packages
(use-package dash)

;; load all my configs
(require 'defaults)
(require 'appearance)
(require 'misc)
(require 'defuns)
(require 'selection)
(require 'keybinds)

;; package and language specific configs
(require 'setup-company)
(require 'setup-projectile)
(require 'setup-eglot)
(require 'setup-python)
(require 'setup-web)
(require 'setup-shackle)

;; (require 'setup-julia)

;; (require 'setup-markdown)
;; (require 'setup-prog-modes)
;; (require 'setup-dired)
;; (require 'setup-flycheck)
;; (require 'setup-eshell)
;; (require 'setup-ibuffer)
;; (require 'setup-mc)
;; (require 'setup-phi-search)
;; (require 'setup-clojure)
;; (require 'setup-yaml)
;; (require 'setup-go)
;; (require 'setup-undo-tree)
;; (require 'setup-toggle-quotes)
;; (require 'setup-ruby)
;; (require 'setup-projectile)
;; (require 'setup-flyspell)


(if window-system
  (setq default-directory (expand-file-name "~")))

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))
