(require 'simple)
(require 'dash)


(use-package ag
  :defer t)

(use-package projectile
  :init
  ;; https://oremacs.com/2015/07/16/callback-quit/
  (defmacro jjp/quit-and-run (&rest body)
    "Quit the minibuffer and run BODY afterwards."
    `(progn
       (put 'quit 'error-message "")
       (run-at-time nil nil
                    (lambda ()
                      (put 'quit 'error-message "Quit")
                      ,@body))
       (abort-recursive-edit)))

  (defun jjp/find-file-or-projectile-find-file ()
    "calls either find-file or projectile-find-file depending
  whether we're in a projectile project or not"
    (interactive)
    ;; in case this is the first time we're using projectile, we
    ;; require it here
    (unless (featurep 'projectile)
      (require 'projectile nil t))
    (if (and (fboundp 'projectile-project-root) (projectile-project-root))
        ;; NOTE this uses dynamic scoping, so make sure to change it
        ;; if we switch to lexical scoping
        (let ((jjp/in-projectile-find-file t))
          (projectile-find-file))
      (call-interactively 'find-file)))

  (defun jjp/drop-to-regular-find-file ()
    (interactive)
    (when (and (boundp 'jjp/in-projectile-find-file) jjp/in-projectile-find-file)
      (jjp/quit-and-run
       (call-interactively 'find-file))))

  :config
  (projectile-mode +1)
  (jjp/exec-path-from-shell-initialize) ;; so we can find `ag'
  ;; for some reason, the fallback-to-regular-find-file code causes a
  ;; dialog window to open in GUI emacs, I don't know why. so we set
  ;; this to prevent that from ever happening. we also set this in
  ;; defaults.el, but also adding it here in case that changes
  (setq use-dialog-box nil)

  :custom
  (projectile-completion-system 'default "It uses ido by default, but we want to use the default for selectrum")
  (projectile-project-search-path
   (-select 'file-directory-p (-map #'expand-file-name '("~/src/" "~/work/" "~"))))

  :bind-keymap
  ("C-c p" . projectile-command-map)
  ("s-p" . projectile-command-map)
  :bind (("C-x C-f" . jjp/find-file-or-projectile-find-file)
         :map projectile-command-map
         ("s" . projectile-ag)
         :map vertico-map
         ("C-x C-f" . jjp/drop-to-regular-find-file)))

(provide 'setup-projectile)
