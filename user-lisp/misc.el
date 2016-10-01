;; misc.el
;; Miscellaneous settings that don't fit in anywhere else and would clutter
;; up the init file

(require 'exec-path-from-shell)

;; Copy some env variables from the default shell
(when window-system
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
    '("GOPATH" "GOROOT")))

;; use json-mode for avsc files
(add-to-list 'auto-mode-alist '("\\.avsc\\'" . json-mode))

;; TODO give magit its own file
(setq magit-push-always-verify nil)

(provide 'misc)
