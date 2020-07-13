;; Key bindings

(setq ns-function-modifier 'hyper) ;; fn key is hyper
(setq ns-esc-modifier 'hyper)

;;  buffers and files
(global-set-key (kbd "C-x C-k") 'kill-buffer-and-window)
(global-set-key (kbd "C-x C-r") 'jjp/rename-current-file)

;; longlines toggle
(global-set-key (kbd "C-c l") 'longlines-mode)

;; Move more quickly
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-f") 'forward-word)
(global-set-key (kbd "M-b") 'backward-word)

;; make scrolling more smooth
(global-set-key (kbd "<wheel-down>") 'scroll-up-line)
(global-set-key (kbd "<wheel-up>") 'scroll-down-line)
(global-set-key (kbd "s-<wheel-down>") 'jjp/scroll-up)
(global-set-key (kbd "s-<wheel-up>") 'scroll-down)

(global-set-key (kbd "C-c o") 'jjp/switch-to-minibuffer)

;; for faster commenting and uncommenting
(global-set-key (kbd "C-x m") 'jjp/comment-or-uncomment-region-or-line)

;; hide show mode
(global-set-key (kbd "C-c h") 'hs-toggle-hiding)

;; text manipulation
(global-set-key (kbd "C-c C-d") 'duplicate-current-line-or-region)

;; use C-x C-b as ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; M-dash dammit
(defun insert-m-dash ()
  (interactive)
  (insert-char ?\—))

(global-set-key (kbd "M-_") 'insert-m-dash)
(provide 'keybinds)
