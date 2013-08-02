;; there are some defuns here that I didn't extract into
;; defuns.el because they are pretty much used only in eshell

(defun eshell-emit-prompt ()
  "Emit a prompt if eshell is being used interactively. I
am redefining it here so that it doesn't screw up my colors"

  (run-hooks 'eshell-before-prompt-hook)
  (if (not eshell-prompt-function)
      (set-marker eshell-last-output-end (point))
    (let ((prompt (funcall eshell-prompt-function)))
      (and eshell-highlight-prompt
           (add-text-properties 0 (length prompt)
                                '(read-only t
                                  ;; face eshell-prompt
                                  rear-nonsticky (face read-only))
                                prompt))
      (eshell-interactive-print prompt)))
  (run-hooks 'eshell-after-prompt-hook))

(defun curr-dir-git-branch-string (pwd)
  "Returns current git branch as a string, or the empty string if
PWD is not in a git repo (or the git command is not found)."
  (interactive)
  (if (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let ((git-output (shell-command-to-string (concat "git branch | grep '\\*' | sed -e 's/^\\* //'"))))
      (propertize
       (concat "[±:"
               (if (> (length git-output) 0)
                   (substring git-output 0 -1)
                 "no branch")
               "]")
      'face `(:foreground "#D1D62D")))
    (propertize
     "[±]" 'face `(:foreground "#555555"))))

(defun curr-venv-string ()
  "Returns a string representing the current virtualenv."
  (interactive)
  (if venv-current-name
      (propertize
       (concat "[§:" venv-current-name "]")
       'face `(:foreground "#33cc33"))
    (propertize
     "[§]" 'face `(:foreground "#555555"))))

(setq eshell-prompt-function
      (lambda ()
        (concat (curr-dir-git-branch-string (eshell/pwd))
                (curr-venv-string) " "
                (abbreviate-file-name (eshell/pwd))
                "\n$ ")))

(setq eshell-highlight-prompt t)

(setq eshell-prompt-regexp "\$ ")

(provide 'setup-eshell)
