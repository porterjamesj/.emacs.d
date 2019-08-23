(require 'projectile)

(setq projectile-project-search-path '("~/src/" "~/work/" "~"))

(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(define-key projectile-mode-map (kbd "s-p s") 'projectile-ag)

(projectile-mode +1)

(provide 'setup-projectile)
