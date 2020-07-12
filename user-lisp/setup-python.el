(use-package python
  :straight (:type built-in)
  :config
  (if (executable-find "pyls")
      (add-hook 'python-mode-hook #'eglot-ensure)))

(provide 'setup-python)
