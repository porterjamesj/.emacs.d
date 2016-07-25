;;======== configure package management ========
(require 'package)

(defvar marmalade '("marmalade" . "http://marmalade-repo.org/packages/"))
(defvar gnu '("gnu" . "http://elpa.gnu.org/packages/"))
(defvar melpa '("melpa" . "http://melpa.org/packages/"))

;; Add third-party repos
(add-to-list 'package-archives marmalade)
(add-to-list 'package-archives melpa t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; packages I use
(defvar user-packages
  '(auto-complete
     dired-details
     epc
     expand-region
     ido-ubiquitous
     flx
     flx-ido
     flycheck
     jedi
     jinja2-mode
     js2-mode
     json-mode
     markdown-mode
     multiple-cursors
     nyan-mode
     smex
     ;; solarized-theme
     color-theme-solarized
     sublime-themes
     gist
     magit
     virtualenvwrapper
     clojure-mode
     cider
     popwin
     smartparens
     phi-search
     erc-hl-nicks
     yaml-mode
     multi-web-mode
     julia-mode
     dockerfile-mode
     go-mode))

;; install any packages that aren't found
(dolist (p user-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'package-manage)
