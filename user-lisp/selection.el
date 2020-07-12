;; selection and filtering with selectrum and prescient

(use-package prescient
  :custom
  (prescient-filter-method '(literal fuzzy initialism regexp))
  (prescient-persist-mode +1))

(use-package company-prescient)
(use-package selectrum-prescient)

(use-package selectrum
  :config
  (selectrum-mode +1)
  (selectrum-prescient-mode +1))

(provide 'selection)
