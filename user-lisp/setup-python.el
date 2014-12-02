;; use virtualenvwrapper
(require 'virtualenvwrapper)

(add-hook 'python-mode-hook
          (lambda ()
            (setq comint-process-echoes t)
            (jedi:setup)
            (unless (file-remote-p default-directory)
              (flycheck-mode))))

(setq jedi:setup-keys t)
(setq jedi:complete-on-dot nil)

;; use flake8 for checking
(setq python-check-command "flake8")

;; set the default virtualenv so that jedi can at least load
(setq python-shell-virtualenv-path "/Users/james/.virtualenvs/base")

;; setup virtualenvwrapper
(setq venv-location "~/.virtualenvs/")
(venv-initialize-eshell)
(venv-initialize-interactive-shells)

(add-to-list 'auto-mode-alist '("\\.wsgi\\'" . python))

(provide 'setup-python)
