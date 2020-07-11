(require 'dash)

(defun jjp/find-file-or-projectile-find-file ()
  "calls either find-file or projectile-find-file depending
  whether we're in a projectile project or not"
  (interactive)
  (if (and (fboundp 'projectile-project-root) projectile-project-root)
    (projectile-find-file)
    (call-interactively 'find-file)))

(use-package projectile
  :config (projectile-mode +1)
  :custom
  (projectile-completion-system 'default "It uses ido by default, but we want to use the default for selectrum")
  (projectile-project-search-path
   (-select 'file-directory-p (-map #'expand-file-name '("~/src/" "~/work/" "~"))))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  ("s-p" . projectile-command-map)
  :bind (("C-x C-f" . jjp/find-file-or-projectile-find-file)
         :map projectile-mode-map
         ("s-p s" . projectile-ag)))

(provide 'setup-projectile)
