(defun jjp/eglot-ensure ()
  ;; eglot-ensure, but only if we're not connected via tramp
  (when (not (file-remote-p default-directory))
    (eglot-ensure)))

(use-package python
  :straight (:type built-in)
  :mode ("\\.py\\'" . python-mode)
  :config
  (require 'eglot)
  (if (executable-find "pyls")
      (add-hook 'python-mode-hook #'jjp/eglot-ensure)))

(provide 'setup-python)
