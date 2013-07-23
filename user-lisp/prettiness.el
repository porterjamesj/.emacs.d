;; prettiness.el
;; Visual settings and appearance tweaks

;; Set font
(set-face-attribute 'default nil :font "Source Code Pro-13")

;; Custom colors
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'solarized-dark t)

;; nyan-mode
;; (add-to-list 'load-path "/Users/james/.emacs.d/elpa/nyan-mode-20120710.1922/")
(require 'nyan-mode)
(nyan-mode t)
;; (nyan-start-animation)

;; powerline
;; disabled for now because of conflicts w/ solarized and nyan mode
;; (add-to-list 'load-path "/Users/james/.emacs.d/powerline/")
;; (require 'powerline)
;; (powerline-default)

(provide 'prettiness)
