(use-package markdown-mode
  :mode (("\\.markdown\\'" . markdown-mode) ("\\.md\\'" . markdown-mode))
  :bind
  ;; markdown mode really aggressively takes over with it's own
  ;; keybindings, so we have to reset them back to normal here
  (:map markdown-mode-map
        ("M-n" . forward-paragraph)
        ("M-p" . backward-paragraph)
        ("M-f" . forward-word)
        ("M-b" . backward-word)
        ("C-e" . move-end-of-line)
        ("C-a" . move-beginning-of-line)))

(use-package flyspell-mode)
