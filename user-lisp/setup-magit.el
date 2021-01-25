;; Package `transient' is the interface used by Magit to display
;; popups.
(use-package transient
  :config

  ;; Allow using `q' to quit out of popups, in addition to `C-g'. See
  ;; <https://magit.vc/manual/transient.html#Why-does-q-not-quit-popups-anymore_003f>
  ;; for discussion.
  (transient-bind-q-to-quit))

(use-package magit
  :defer 5 ;; not clear why this is necessary, `bind' should defer on
           ;; it's own, but for some reason startup is way slower
           ;; without this
  :bind (("C-c s" . #'magit-status))
  :init
  ;; Suppress the message we get about "Turning on
  ;; magit-auto-revert-mode" when loading Magit.
  (setq magit-no-message '("Turning on magit-auto-revert-mode..."))
  :custom
  (magit-save-repository-buffers nil)
  (magit-push-always-verify nil))

(provide 'setup-magit)
