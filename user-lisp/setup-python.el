(add-hook 'python-mode-hook
          (lambda ()
            (setq comint-process-echoes t)
            (jedi:setup)))
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot nil)

;; use flake8 for checking
(setq python-check-command "flake8")

;; set the default virtualenv so that jedi can at least load
(setq python-shell-virtualenv-path "/Users/james/.virtualenvs/base")

(provide 'setup-python)
