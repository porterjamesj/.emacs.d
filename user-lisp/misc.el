;; misc.el
;;
;; Miscellaneous settings that don't fit in anywhere else and would
;; clutter up the init file

;; TODO have this is a hook on go mode
;;   (exec-path-from-shell-copy-envs
;;     '("GOPATH" "GOROOT")))

;; TODO give magit its own file
(setq magit-push-always-verify nil)

(provide 'misc)
