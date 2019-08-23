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


;; stuff for the bbatsov solarized version, which i used to use but
;; doesnt seem happy to run in a terminal
;; (setq solarized-high-contrast-mode-line t)
;; (setq solarized-use-less-bold t)
;; (load-theme 'solarized-dark t)

(require 'color-theme-solarized)
(load-theme 'solarized t)

;; set solarized to dark
(setq solarized-style 'dark)
(set-frame-parameter nil 'background-mode solarized-style)
(set-terminal-parameter nil 'background-mode solarized-style)
(enable-theme 'solarized)

(powerline-nano-theme)
;; virtualenv on mode line
(setq-default mode-line-format (-concat '("[venv:" (:exec venv-current-name) "]") mode-line-format))

;; nyan-mode
(require 'nyan-mode)
(nyan-mode t)

(provide 'prettiness)
