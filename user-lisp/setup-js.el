;; js2-mode
(add-hook 'js-mode-hook 'js2-minor-mode)

;; set javascript mode tab width to 2
(setq js-indent-level 2)

(defun js-toggle-tab-width ()
  (interactive)
  (if (eql js-indent-level 2)
      (setq js-indent-level 4)
    (setq js-indent-level 2)))

;; make js2 linter ignore common globals
(setq js2-global-externs '("module" "require" "$" "_"
                           "window" "$SCRIPT_ROOT" "d3"
                           "describe" "it" "exports"
                           "chrome"))

(provide 'setup-js)
