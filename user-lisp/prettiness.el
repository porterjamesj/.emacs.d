;; prettiness.el
;; Visual settings and appearance tweaks

;; Set font
(set-face-attribute 'default nil :font "Source Code Pro-13")

;; Custom colors
(load-theme 'solarized-dark t)

;; nyan-mode
(require 'nyan-mode)
(nyan-mode t)

(provide 'prettiness)
