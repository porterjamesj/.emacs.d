(require 'projectile)
(require 'dash)

(setq projectile-project-search-path
  (-select 'file-directory-p (-map #'expand-file-name '("~/src/" "~/work/" "~"))))



(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(define-key projectile-mode-map (kbd "s-p s") 'projectile-ag)

(projectile-mode +1)

(provide 'setup-projectile)
