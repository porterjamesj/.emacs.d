;; misc.el
;; Miscellaneous settings that don't fit in anywhere else and would clutter
;; up the init file


;; TODO this is really slow, add it back but so it only happens when go-mode is loaded

(use-package exec-path-from-shell)

(when window-system
  (exec-path-from-shell-initialize))
;;   (exec-path-from-shell-copy-envs
;;     '("GOPATH" "GOROOT")))

;; TODO give magit its own file
(setq magit-push-always-verify nil)

(provide 'misc)
