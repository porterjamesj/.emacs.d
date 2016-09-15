(require 'ido)
(require 'flx-ido)
(require 'ido-grid-mode)
(require 'ido-ubiquitous)

(ido-mode t)

(flx-ido-mode 1)

(ido-ubiquitous t)

(ido-grid-mode 1)

(setq ido-grid-mode-max-columns 1)
(setq ido-grid-mode-max-rows 8)

(setq ido-grid-mode-keys nil)

(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map (kbd "C-p") 'ido-grid-mode-up)
            (define-key ido-completion-map (kbd "C-n") 'ido-grid-mode-down)
            (define-key ido-completion-map (kbd "<up>") 'ido-grid-mode-up)
            (define-key ido-completion-map (kbd "<down>") 'ido-grid-mode-down)))

(provide 'setup-ido)
