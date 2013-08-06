;; prettiness.el
;; Visual settings and appearance tweaks

;; Set font
(set-face-attribute 'default nil :font "Source Code Pro-13")

;; Use Consolas as fallback for Greek
(set-fontset-font "fontset-default"
                  (cons (decode-char 'ucs #x1f00)
                        (decode-char 'ucs #x1fff))
                  "Consolas-15")

(set-fontset-font "fontset-default"
                  (cons (decode-char 'ucs #x0370)
                        (decode-char 'ucs #x03ff))
                  "Consolas-15")

;; Custom colors
(load-theme 'graham t)

;; virtualenv on mode line
(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))
;; nyan-mode
(require 'nyan-mode)
(nyan-mode t)

(provide 'prettiness)
