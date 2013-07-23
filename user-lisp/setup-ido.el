
;; ido mode
(require 'ido)
(ido-mode t)

;; ido flx matching
(require 'flx-ido)
(flx-ido-mode 1)

;; ido-ubiquitous
;; better than ido-everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous t)

(provide 'setup-ido)
