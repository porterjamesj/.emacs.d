;; prettiness.el
;; Visual settings and appearance tweaks

(require 'dash)

(if window-system
  (progn
    (if (member "Source Code Pro" (font-family-list))
      (set-face-attribute 'default nil :font "Source Code Pro-13")
      (if (member "Ubuntu Mono" (font-family-list))
        (set-face-attribute 'default nil :font "Ubuntu Mono-12")))

    ;; Use Consolas as fallback for Greek
    (set-fontset-font "fontset-default"
      (cons (decode-char 'ucs #x1f00)
        (decode-char 'ucs #x1fff))
      "Consolas-15")

    (set-fontset-font "fontset-default"
      (cons (decode-char 'ucs #x0370)
        (decode-char 'ucs #x03ff))
      "Consolas-15")))

;; TODO pretty ugly in terminal
(if (display-graphic-p)
  (progn
    (setq solarized-high-contrast-mode-line t)
    (setq solarized-use-less-bold t)
    (load-theme 'solarized-dark t))
  (load-theme 'wombat t))

(powerline-nano-theme)
;; virtualenv on mode line
(setq-default mode-line-format (-concat '("[venv:" (:exec venv-current-name) "]") mode-line-format))

;; nyan-mode
(require 'nyan-mode)
(nyan-mode t)

(provide 'prettiness)
