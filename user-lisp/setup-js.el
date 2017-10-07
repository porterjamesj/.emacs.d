;; js2-mode

;; work with react jsx files
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.es6\\'" . js2-jsx-mode))

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
(add-hook 'js2-jsx-mode-hook #'set-jsx-indentation)

;; make js2 linter ignore common globals
(setq js2-global-externs '("module" "require" "$" "_"
                           "window" "$SCRIPT_ROOT" "d3"
                           "describe" "it" "exports"
                           "chrome" "fetch"))

(provide 'setup-js)
