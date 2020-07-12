(use-package ruby
  :straight (:type built-in)
  :mode ("\\.rb\\'" . ruby-mode)
  :custom (ruby-insert-encoding-magic-comment nil))

(provide 'setup-ruby)
