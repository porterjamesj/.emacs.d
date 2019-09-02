(require 'flyspell)
(require 'flyspell-correct)

(setq ispell-local-dictionary-alist '(("en_US"
                                       "[[:alpha:]]"
                                       "[^[:alpha:]]"
                                       "[']"
                                       t
                                       ("-d" "en_US")
                                       nil
                                        iso-8859-1)))

(setq ispell-program-name "hunspell")
(setq ispell-local-dictionary "en_US")

;; set ivy as correcting interface
(setq flyspell-correct-interface #'flyspell-correct-popup)

;; bind flyspell-correct-wrapper
(define-key flyspell-mode-map (kbd "C-;") #'flyspell-correct-wrapper)


(provide 'setup-flyspell)
