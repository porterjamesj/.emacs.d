;; Emacs Configuration
;; James Porter
;; 2013

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; put .emacs.d and user-lisp directory on load-path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/user-lisp")

(let ((base "~/.emacs.d/lib"))
  (add-to-list 'load-path base)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)))))

;; Configure package management and install/load third party packages
(require 'package-manage)
;; Emacs defaults
(require 'defaults)
;; Miscellaenous junk is in here
(require 'misc)
;; Appearance and visual tweaks
(require 'prettiness)
;; my custom functions
(require 'defuns)
;; Key bindings
(require 'keybinds)
;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mode specific congiguration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'setup-python)
(require 'setup-ac)
(require 'setup-ido)
(require 'setup-tramp)
(require 'setup-smex)
(require 'setup-julia)
(require 'setup-js)
(require 'setup-markdown)
(require 'setup-prog-modes)
(require 'setup-dired)
(require 'setup-flycheck)
(require 'setup-mingus)
