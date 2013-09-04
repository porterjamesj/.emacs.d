;; Key bindings

(setq ns-function-modifier 'hyper) ;; fn key is hyper

;;  buffers and files
(global-set-key (kbd "C-x C-k") 'kill-buffer-and-window)
(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

;; longlines toggle
(global-set-key (kbd "C-c l") 'longlines-mode)

;; Move more quickly
(global-set-key (kbd "s-n") 'fast-down)
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "s-p") 'fast-up)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "s-f") 'fast-up)
(global-set-key (kbd "M-f") 'forward-word)
(global-set-key (kbd "s-b") 'fast-forward)
(global-set-key (kbd "M-b") 'backward-word)


;; make scrolling more smooth
(global-set-key (kbd "<wheel-down>") 'scroll-up-line)
(global-set-key (kbd "<wheel-up>") 'scroll-down-line)
(global-set-key (kbd "s-<wheel-down>") 'scroll-up)
(global-set-key (kbd "s-<wheel-up>") 'scroll-down)

;; buffer navigation
(global-set-key (kbd "C-x <right>") 'next-non-emacs-buffer)
(global-set-key (kbd "C-x <left>") 'previous-non-emacs-buffer)
(global-set-key (kbd "C-x C-<right>") 'next-non-emacs-buffer)
(global-set-key (kbd "C-x C-<left>") 'previous-non-emacs-buffer)

(global-set-key (kbd "C-c o") 'switch-to-minibuffer)

;; expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; inferior julia
(add-hook 'julia-mode-hook
          (lambda () (local-set-key (kbd "s-<return>")
                                    'inferior-julia-send-line-or-region)))

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands) ;; old M-x

;; for faster commenting and uncommenting
(global-set-key (kbd "C-x m") 'comment-or-uncomment-region-or-line)

;; hide show mode
(global-set-key (kbd "C-c h") 'hs-toggle-hiding)

;; text manipulation
(global-set-key (kbd "C-c C-d") 'duplicate-current-line-or-region)

;; use C-x C-b as ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(provide 'keybinds)
