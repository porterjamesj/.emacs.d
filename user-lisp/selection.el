;; selection and filtering with selectrum and prescient

(use-package prescient
  :custom
  (prescient-filter-method '(literal fuzzy initialism regexp))
  (prescient-persist-mode +1))

(use-package vertico
  :straight (:files (:defaults "extensions/*"))
  :init
  (vertico-mode))

(use-package vertico-prescient
  :init
  (vertico-prescient-mode 1))

(provide 'selection)
