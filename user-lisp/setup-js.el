;; js2-mode

;; work with react jsx files
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.es6\\'" . rjsx-mode))

;; set javascript mode tab width to 2
(setq js-indent-level 2)
(setq js2-basic-offset 2)

(defun js-toggle-tab-width ()
  (interactive)
  (if (eql js-indent-level 2)
      (setq js-indent-level 4)
    (setq js-indent-level 2))
  (setq js2-basic-offset js-indent-level))


;; set indetation to 2 in jsx
(defun set-jsx-indentation ()
  (setq-local sgml-basic-offset js2-basic-offset))
(add-hook 'rjsx-mode-hook #'set-jsx-indentation)

;; make js2 linter ignore common globals
(setq js2-global-externs '("module" "require" "$" "_"
                           "window" "$SCRIPT_ROOT" "d3"
                           "describe" "it" "exports"
                           "chrome" "fetch"))

(setq js2-strict-trailing-comma-warning nil)

(provide 'setup-js)
