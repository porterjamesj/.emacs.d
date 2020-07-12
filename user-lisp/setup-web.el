;; mostly stolen from radian
;; https://github.com/raxod502/radian/blob/c114b36abb32752e0ed5a3e3a797d4ce60fad92a/emacs/radian.el#L3437

(use-package web-mode
  :init
  ;; prevent scss mode from being used, we want web-mode for everything
  ;; (rassq-delete-all 'scss-mode auto-mode-alist)

  ;; Unfortunately `web-mode' does not come with `auto-mode-alist'
  ;; autoloads. We have to establish them manually. This list comes
  ;; from the official website at <http://web-mode.org/> as of
  ;; 2018-07-09.
  :mode (("\\.phtml\\'" . web-mode)
         ("\\.tpl\\.php\\'" . web-mode)
         ("\\.[agj]sp\\'" . web-mode)
         ("\\.as[cp]x\\'" . web-mode)
         ("\\.erb\\'" . web-mode)
         ("\\.mustache\\'" . web-mode)
         ("\\.djhtml\\'" . web-mode)
         ("\\.html?\\'" . web-mode)
         ;; additions from radian
         ("\\.ejs\\'" . web-mode)
         ("\\.jsx?\\'" . web-mode)
         ("\\.tsx?\\'" . web-mode)
         ("\\.css\\'" . web-mode)
         ;; additions from me (mostly recurse.com stuff)
         ("\\.scss\\'" . web-mode)
         ("\\.es6\\'" . web-mode)
         ("\\.module\\.es6\\'" . web-mode))
  :config

  ;; Indent by two spaces by default. Compatibility with Prettier.

  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)

  ;; Autocomplete </ instantly.
  (setq web-mode-enable-auto-closing t)

  ;; Insert matching tags automatically. Why this is "mode 2", I have
  ;; not the slightest idea.
  (setq web-mode-auto-close-style 2)

  ;; Don't insert quotes automatically. It messes with JSX.
  (setq web-mode-enable-auto-quoting nil)

  ;; Disable `web-mode' automatically reindenting a bunch of
  ;; surrounding code when you paste anything. It's real annoying if
  ;; it happens to not know how to indent your code correctly.
  (setq web-mode-enable-auto-indentation nil)

  ;; Create line comments instead of block comments by default in
  ;; JavaScript. See <https://github.com/fxbois/web-mode/issues/619>.
  (let ((types '("javascript" "jsx")))
    (setq web-mode-comment-formats
          (cl-remove-if (lambda (item)
                          (member (car item) types))
                        web-mode-comment-formats))
    (dolist (type types)
      (push (cons type "//") web-mode-comment-formats)))

  ;; treat .js, .js, .es6, .module.es6 files as jsx
  (setq web-mode-content-types-alist
        '(("jsx" . "\\.js[x]?\\'")
          ("jsx" . "\\.es6\\'")
          ("jsx" . "\\.module\\.es6\\'"))))

(provide 'setup-web)
