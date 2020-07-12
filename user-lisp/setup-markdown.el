(use-package flyspell-correct)

(use-package flyspell
  :straight (:type built-in)
  :hook (markdown-mode . flyspell-mode)
  :bind (:map flyspell-mode-map) ("C-;" . flyspell-correct-wrapper)
  :config
  (require 'flyspell-correct)
  (when (executable-find "hunspell")
    (setq ispell-local-dictionary-alist '(("en_US"
                                           "[[:alpha:]]"
                                           "[^[:alpha:]]"
                                           "[']"
                                           t
                                           ("-d" "en_US")
                                           nil
                                           iso-8859-1)))

    (setq ispell-program-name "hunspell")
    (setq ispell-local-dictionary "en_US")))

(use-package markdown-mode
  :mode (("\\.markdown\\'" . markdown-mode) ("\\.md\\'" . markdown-mode))
  ;; markdown mode really aggressively takes over with it's own
  ;; keybindings, so we have to reset them back to normal here
  :bind
  (:map markdown-mode-map
        ("M-n" . forward-paragraph)
        ("M-p" . backward-paragraph)
        ("M-f" . forward-word)
        ("M-b" . backward-word)
        ("C-e" . move-end-of-line)
        ("C-a" . move-beginning-of-line)))

(provide 'setup-markdown)
