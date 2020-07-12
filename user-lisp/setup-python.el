(use-package python
  :straight (:type built-in)
  :mode ("\\.py\\'" . python-mode)
  :config
  (require 'eglot)
  (if (executable-find "pyls")
      (add-hook 'python-mode-hook #'eglot-ensure)))

(provide 'setup-python)
