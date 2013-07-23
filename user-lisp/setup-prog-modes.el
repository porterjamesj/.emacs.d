;; enable hs-minor mode
(add-hook 'prog-mode-hook #'hs-minor-mode)
;; flycheck on in programming modes
(add-hook 'prog-mode-hook 'flycheck-mode)

;; shamelessly stolen from Zach Allaun

;; in programming modes, show trailing whitespace and leading tabs, and
;; highlight characters past column 80
(add-hook 'prog-mode-hook 'whitespace-mode)

(provide 'setup-prog-modes)
