;; color theme, fonts, and other visual tweaks

;; The name is very confusing here, the `color-theme` package is actually not involved at all
;; I like this package better than the other solarized themes because it supports terminal and GUI emacs
;; seamlessly. However, it's not on MELPA because it still uses the obsolete `color-theme` package
;;
;; Here we use my fork, which rips out all the color-theme stuff and just has the `deftheme` version
(use-package solarized-theme
  :straight
  (:host github :repo "porterjamesj/emacs-color-theme-solarized"))

;; make fringes same color as background
;; https://emacs.stackexchange.com/questions/5342/
(set-face-attribute 'fringe nil :background nil)

;; NOTE this is the slowest part of init
(if window-system
  (progn
    ;; make fringe a bit smaller
    (fringe-mode 4)
    ;; fonts
    (let ((fonts (font-family-list)))
      (if (member "Source Code Pro" fonts)
          (set-face-attribute 'default nil :font "Source Code Pro-13")
        (if (member "Ubuntu Mono" fonts)
            (set-face-attribute 'default nil :font "Ubuntu Mono-12"))))

    ;; Use Consolas as fallback for Greek
    (set-fontset-font "fontset-default"
      (cons (decode-char 'ucs #x1f00)
        (decode-char 'ucs #x1fff))
      "Consolas-15")

    (set-fontset-font "fontset-default"
      (cons (decode-char 'ucs #x0370)
        (decode-char 'ucs #x03ff))
      "Consolas-15")))

;; TODO modeline

(provide 'appearance)
