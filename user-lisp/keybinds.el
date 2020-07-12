;; Key bindings

(setq ns-function-modifier 'hyper) ;; fn key is hyper
(setq ns-esc-modifier 'hyper)

;;  buffers and files
(global-set-key (kbd "C-x C-k") 'kill-buffer-and-window)
(global-set-key (kbd "C-x C-r") 'jjp/rename-current-file)

;; longlines toggle
(global-set-key (kbd "C-c l") 'longlines-mode)

;; Move more quickly
(global-set-key (kbd "s-n") 'jjp/fast-down)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "s-p") 'jjp/fast-up)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "s-f") 'jjp/fast-up)
(global-set-key (kbd "M-f") 'forward-word)
(global-set-key (kbd "s-b") 'jjp/fast-forward)
(global-set-key (kbd "M-b") 'backward-word)

;; make scrolling more smooth
(global-set-key (kbd "<wheel-down>") 'scroll-up-line)
(global-set-key (kbd "<wheel-up>") 'scroll-down-line)
(global-set-key (kbd "s-<wheel-down>") 'jjp/scroll-up)
(global-set-key (kbd "s-<wheel-up>") 'scroll-down)

;; buffer navigation
(global-set-key (kbd "H-l") 'jjp/next-non-emacs-buffer)
(global-set-key (kbd "H-j") 'jjp/previous-non-emacs-buffer)

;; actual navigation
(global-set-key (kbd "s-K") 'forward-paragraph)
(global-set-key (kbd "s-I") 'backward-paragraph)
(global-set-key (kbd "s-L") 'forward-word)
(global-set-key (kbd "s-J") 'backward-word)

(global-set-key (kbd "s-i") 'previous-line)
(global-set-key (kbd "s-k") 'next-line)
(global-set-key (kbd "s-l") 'forward-char)
(global-set-key (kbd "s-j") 'backward-char)

(global-set-key (kbd "C-c o") 'jjp/switch-to-minibuffer)

;; for faster commenting and uncommenting
(global-set-key (kbd "C-x m") 'jjp/comment-or-uncomment-region-or-line)

;; hide show mode
(global-set-key (kbd "C-c h") 'hs-toggle-hiding)

;; text manipulation
(global-set-key (kbd "C-c C-d") 'duplicate-current-line-or-region)

;; use C-x C-b as ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; movement with center
(global-set-key (kbd "C-H-n") 'jjp/next-line-with-center)
(global-set-key (kbd "C-H-p") 'jjp/previous-line-with-center)
(global-set-key (kbd "M-H-n") 'jjp/forward-paragraph-with-center)
(global-set-key (kbd "M-H-p") 'jjp/backward-paragraph-with-center)

;; mark next
(global-set-key (kbd "C-c C-n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)

;; M-dash dammit
(defun insert-m-dash ()
  (interactive)
  (insert-char ?\—))

;; magit status
(global-set-key (kbd "C-c s") 'magit-status)

(global-set-key (kbd "M-_") 'insert-m-dash)
(provide 'keybinds)
