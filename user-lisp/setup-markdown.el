(require 'markdown-mode)

;; add correct extensions for markdown mode
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; fix M-n and M-p
(define-key markdown-mode-map (kbd "M-n") 'forward-paragraph)
(define-key markdown-mode-map (kbd "M-p") 'backward-paragraph)

(provide 'setup-markdown)
