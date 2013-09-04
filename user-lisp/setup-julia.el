(require 'julia-mode)

;; stuff for inferior julia
(setq inferior-julia-program
      (expand-file-name "~/julia/usr/bin/julia-release-basic"))
(define-key julia-mode-map (kbd "s-<return>") 'inferior-julia-send-line-or-region)

(provide 'setup-julia)
