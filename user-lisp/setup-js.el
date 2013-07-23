;; js2-mode
(add-hook 'js-mode-hook 'js2-minor-mode)

;; set javascript mode tab width to 2
(setq js-indent-level 2)

;; make js2 linter ignore common globals
(setq js2-global-externs '("module" "require" "$" "_"))

(provide 'setup-js)
