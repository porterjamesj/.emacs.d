(require 'company)

(global-company-mode)

(setq company-idle-delay 0.08)
(setq company-minimum-prefix-length 1)

(define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
(define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)
(define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)

(provide 'setup-company)
