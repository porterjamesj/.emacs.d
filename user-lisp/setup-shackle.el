(use-package shackle
  :straight (:repo "https://depp.brause.cc/shackle.git")
  :config (shackle-mode)
  :custom (shackle-rules
           '(("*Help*" :select t)
             ('ag-mode :select t)
             ("\\`\\*magit-diff: .*?\\'" :regexp t :noselect t))
           (shackle-default-rule '(:popup t :select t))
           (shackle-default-size 0.4)
           (shackle-inhibit-window-quit-on-same-windows t)))

(provide 'setup-shackle)
