;; defuns.el
;; homemade functions (more honestly, functions lifted from other people)

;; general


(defvar jjp/exec-path-loaded-from-shell nil)

(defun jjp/exec-path-from-shell-initialize ()
  "If we're windowed, calls exec-path-from-shell-initialize if we
  haven't already done it. This is useful for defering doing
  this, since if we don't it makes startup much slower"
  (when window-system
    (unless jjp/exec-path-loaded-from-shell
      (exec-path-from-shell-initialize)
      (setq jjp/exec-path-loaded-from-shell t))))

(defun jjp/find-file-or-projectile-find-file ()
  "calls either find-file or projectile-find-file depending
  whether we're in a projectile project or not"
  (interactive)
  (if (projectile-project-root)
    (projectile-find-file)
    (find-file)))

(defun jjp/copy-line-or-region ()
  "copies the region if active, the current line if not."
  (interactive)
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position) (line-end-position))))

(defun jjp/rename-current-buffer-file ()
  "renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

;; from the wiki http://www.emacswiki.org/emacs/MiniBuffer
(defun jjp/switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

;; movement

(defun jjp/fast-down ()
  (interactive)
  (ignore-errors (next-line 5)))

(defun jjp/fast-up ()
  (interactive)
  (ignore-errors (previous-line 5)))

(defun jjp/fast-forward ()
  (interactive)
  (ignore-errors (forward-char 5)))

(defun jjp/fast-back ()
  (interactive)
  (ignore-errors (backward-char 5)))


;; shamelessly stolen from josh miller

(defun jjp/emacs-buffer-p (name)
  (string-match-p "\\*.*\\*" name))

(defun jjp/next-non-emacs-buffer (&optional original)
  "Similar to next-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (next-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (next-non-emacs-buffer tmp-orig))))

(defun jjp/previous-non-emacs-buffer (&optional original)
  "Similar to previous-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (previous-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (previous-non-emacs-buffer tmp-orig))))

(defun jjp/previous-line-with-center ()
  (interactive)
  (ignore-errors
    (previous-line)
    (recenter)))

(defun jjp/next-line-with-center ()
  (interactive)
  (ignore-errors
    (next-line)
    (recenter)))

(defun jjp/forward-paragraph-with-center ()
  (interactive)
  (ignore-errors
    (forward-paragraph)
    (recenter)))

(defun jjp/backward-paragraph-with-center ()
  (interactive)
  (ignore-errors
    (backward-paragraph)
    (recenter)))

(defun jjp/comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(defun jjp/duplicate-current-line-or-region ()
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive)
    (let (beg end regionp deactivate-mark)
      (if (region-active-p)
          (progn
            (setq regionp t)
            (setq beg (region-beginning) end (region-end)))
        (setq beg (line-beginning-position) end (line-end-position)))
      (goto-char end)
      (when (not regionp)
        (insert "\n"))
      (insert (buffer-substring beg end))
      (when regionp
        (progn
          (goto-char end)
          (set-mark-command nil)
          (goto-char (+ end (- end beg)))))))

;; misc

(defun jjp/calc-eval-region (arg beg end)
  "Calculate the region and display the result in the echo area.
With prefix ARG non-nil, insert the result at the end of region."
  (interactive "P\nr")
  (let* ((expr (buffer-substring-no-properties beg end))
         (result (calc-eval expr)))
    (if (null arg)
        (message "%s = %s" expr result)
      (goto-char end)
      (save-excursion
        (insert (concat " = " result))))))

(defun jjp/profile-init ()
  (interactive)
  (use-package esup)
  (esup))

(provide 'defuns)
