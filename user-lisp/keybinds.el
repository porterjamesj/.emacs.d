;; Key bindings

(setq ns-function-modifier 'hyper) ;; fn key is hyper
(setq ns-esc-modifier 'hyper)

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
(global-set-key (kbd "H-l") 'next-non-emacs-buffer)
(global-set-key (kbd "H-j") 'previous-non-emacs-buffer)

;; actual navigation
(global-set-key (kbd "s-K") 'forward-paragraph)
(global-set-key (kbd "s-I") 'backward-paragraph)
(global-set-key (kbd "s-L") 'forward-word)
(global-set-key (kbd "s-J") 'backward-word)

(global-set-key (kbd "s-i") 'previous-line)
(global-set-key (kbd "s-k") 'next-line)
(global-set-key (kbd "s-l") 'forward-char)
(global-set-key (kbd "s-j") 'backward-char)

;; mark-active minor mode
;; thanks to textpatten on stackoverflow: http://stackoverflow.com/questions/5651327/how-to-define-keybinding-inside-a-marked-region
;; thank goodness we can hook things onto changes to the mark

(defvar active-region-mode-map
  (let ((map (make-sparse-keymap)))
    map)
  )

(define-minor-mode active-region-mode
  "Active Region minor mode."
  :init-value nil
  :lighter " Region"
  :keymap active-region-mode-map
  :group 'active-region
  )

(defun active-region-on ()
  (active-region-mode 1))
(defun active-region-off ()
  (active-region-mode -1))
(add-hook 'activate-mark-hook 'active-region-on)
(add-hook 'deactivate-mark-hook 'active-region-off)

;; ^ this allows for easier navigation when the mark is active
(define-key active-region-mode-map (kbd "i") 'previous-line)
(define-key active-region-mode-map (kbd "k") 'next-line)
(define-key active-region-mode-map (kbd "l") 'forward-char)
(define-key active-region-mode-map (kbd "j") 'backward-char)

(define-key active-region-mode-map (kbd "i") 'backward-paragraph)
(define-key active-region-mode-map (kbd "k") 'forward-paragraph)
(define-key active-region-mode-map (kbd "l") 'forward-word)
(define-key active-region-mode-map (kbd "j") 'backward-word)

;; arrow keys are evil, don't use them
(global-set-key (kbd "<up>") nil)
(global-set-key (kbd "<down>") nil)
(global-set-key (kbd "<left>") nil)
(global-set-key (kbd "<right>") nil)

(global-set-key (kbd "C-c o") 'switch-to-minibuffer)

;; expand region
(global-set-key (kbd "C-=") 'er/expand-region)

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
;; M-dash dammit
(defun insert-m-dash ()
  (interactive)
  (insert-char ?\—))

(global-set-key (kbd "M-_") 'insert-m-dash)
(provide 'keybinds)
