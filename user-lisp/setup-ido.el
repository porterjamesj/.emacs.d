(require 'ido)
(require 'flx-ido)
(require 'ido-grid-mode)
(require 'ido-completing-read+)
(require 'smex)

(ido-mode t)
(ido-everywhere 1)

(flx-ido-mode 1)

(ido-ubiquitous-mode 1)

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

(smex-initialize)

(provide 'setup-ido)
