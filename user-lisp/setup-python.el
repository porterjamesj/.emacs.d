;; use virtualenvwrapper
(require 'virtualenvwrapper)
(require 'flycheck-pycheckers)

(global-company-mode)

(add-hook 'python-mode-hook
          (lambda ()
            (setq comint-process-echoes t)
            (flycheck-mode-if-not-remote)
            (add-to-list 'company-backends 'company-jedi)))

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))

(when
  (and
    (not (file-directory-p
           (locate-user-emacs-file ".python-environments")))
    (executable-find "virtualenv"))
  (jedi:install-server))

;; NOTE this will only work with python 3 and if mypy is installed
;; what we should do is figure out some way to detect our situation
;; (what python version are we in, is mypy installed, etc.) and set
;; this variable accordingly
;;
;; could use buffer local variables to achieve this for different
;; buffers inhttps://www.emacswiki.org/emacs/BufferLocalVariable
(setq flycheck-pycheckers-checkers '(flake8))


;; use flake8 for checking if we're using the default pyflakes checker
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
