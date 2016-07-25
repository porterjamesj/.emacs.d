(require 'markdown-mode)

;; add correct extensions for markdown mode
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; fix M-n and M-p
(define-key markdown-mode-map (kbd "M-n") 'forward-paragraph)
(define-key markdown-mode-map (kbd "M-p") 'backward-paragraph)

;; fix M-b and M-f why does this mode override so many useful keys :/
(define-key markdown-mode-map (kbd "M-f") 'forward-word)
(define-key markdown-mode-map (kbd "M-b") 'backward-word)

;; GAHHHHH
(define-key markdown-mode-map (kbd "C-e") 'move-end-of-line)
(define-key markdown-mode-map (kbd "M-a") 'move-beginning-of-line)

(add-hook 'markdown-mode-hook
  (lambda ()
    (flyspell-mode)
    (auto-fill-mode)))

(provide 'setup-markdown)
