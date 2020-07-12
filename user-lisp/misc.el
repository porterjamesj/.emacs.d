;; misc.el
;;
;; Miscellaneous little-used programming modes and settings that don't
;; quite merit their own file

(use-package julia-mode
  :mode ("\\.jl\\'" . julia-mode))

(use-package yaml-mode
  :mode ("\\.sls\\'" . yaml-mode))

(use-package clojure-mode
  :mode ("\\.clj\\'" . clojure-mode)
  :config (setq lisp-indent-offset 2))

(use-package go-mode
  :mode ("\\.go\\'" . go-mode)
  :hook (before-save . gofmt-before-save)
  :bind ("C-c C-i" . go-remove-unused-imports)
  :config
  (require 'exec-path-from-shell)
  (defvar jjp/gopath-copied-from-shell nil)
  (when (not jjp/gopath-copied-from-shell)
    (exec-path-from-shell-copy-envs
     '("GOPATH" "GOROOT")))
  (add-hook 'go-mode-hook
            (lambda ()
              (setq tab-width 4)
              (flycheck-mode-on-safe))))

(use-package undo-tree
  :demand t
  :bind (:map undo-tree-map) ("M-_" . insert-m-dash)
  :config
  (global-undo-tree-mode))

(provide 'misc)
