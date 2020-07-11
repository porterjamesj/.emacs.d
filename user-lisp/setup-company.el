(use-package company
  :config
  (global-company-mode)
  :custom
  (company-idle-delay 0.08)
  (company-minimum-prefix-length 1)
  :bind
  (:map company-active-map
        ("TAB" . company-complete-common-or-cycle)
        ("C-n" . company-select-next-or-abort)
        ("C-p" . company-select-previous-or-abort)))

(provide 'setup-company)
