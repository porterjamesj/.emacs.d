;; use virtualenvwrapper
(require 'virtualenvwrapper)

(add-hook 'python-mode-hook
          (lambda ()
            (setq comint-process-echoes t)
            ;; (jedi:setup)
            (unless (file-remote-p default-directory)
              (flycheck-mode))))

;; (setq jedi:setup-keys t)
;; (setq jedi:complete-on-dot nil)

;; use flake8 for checking
(setq python-check-command "flake8")

;; setup virtualenvwrapper
(setq venv-location "~/.virtualenvs/")
(venv-initialize-eshell)
(venv-initialize-interactive-shells)

(add-to-list 'auto-mode-alist '("\\.wsgi\\'" . python-mode))

(setq
  python-shell-interpreter "ipython"
  python-shell-interpreter-args "--simple-prompt -i")


;; this is necessary for hilarious reasons to make it work with IPython 5
(setq python-shell-completion-string-code "print(';'.join(__PYTHON_EL_get_completions('''%s''')))\n")



(add-hook 'comint-mode-hook
  (function (lambda ()
              (local-set-key (kbd "<up>") 'comint-previous-input)
              (local-set-key (kbd "<down>") 'comint-next-input)
              (local-set-key (kbd "C-r") 'comint-history-isearch-backward))))

(provide 'setup-python)
