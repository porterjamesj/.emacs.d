;; misc.el
;; Miscellaneous settings that don't fit in anywhere else and would clutter
;; up the init file

;; Make emacs have same path environment variable as login shell
(if (not (getenv "TERM_PROGRAM"))
    (let ((path (shell-command-to-string
                 "$SHELL -cl \"printf %s \\\"\\\$PATH\\\"\"")))
      (setenv "PATH" path)
      (setq exec-path (split-string path ":"))))

(provide 'misc)
