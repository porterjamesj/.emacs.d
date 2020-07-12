(use-package multiple-cursors
  :bind
  ("C-c C-n" . mc/mark-next-like-this)
  ("C-c C-a" . mc/mark-all-like-this))

;; phi-search is an I-search replacement that plays nicely with
;; multiple-cursors.el
(use-package phi-search
  :bind
  ("C-s" . phi-search)
  ("C-r" . phi-search-backward))

(provide 'setup-mc)
