;; Emacs Configuration
;; James Porter
;; 2013

;; this prevents emacs from trying to autoinsert a
;; (package-initialize) call here, which i do in
;; user-lisp/package-manage.el.
;;
;; there may be a more official way of doing this, i am not sure
(setq package--init-file-ensured 't)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; put user-lisp directory on load-path
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
(unless (file-exists-p custom-file)
  (shell-command (concat "touch " custom-file)))
(load custom-file)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mode specific congiguration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'setup-python)
(require 'setup-company)
(require 'setup-ido)
(require 'setup-tramp)
(require 'setup-julia)
(require 'setup-js)
(require 'setup-markdown)
(require 'setup-prog-modes)
(require 'setup-dired)
(require 'setup-flycheck)
(require 'setup-mingus)
(require 'setup-eshell)
(require 'setup-popwin)
(require 'setup-ibuffer)
(require 'setup-mc)
(require 'setup-phi-search)
;; (require 'setup-irc)
(require 'setup-clojure)
(require 'setup-yaml)
(require 'setup-go)
(require 'setup-undo-tree)
(require 'setup-toggle-quotes)
(require 'setup-ruby)
(require 'setup-projectile)

(if window-system
  (setq default-directory (expand-file-name "~")))
