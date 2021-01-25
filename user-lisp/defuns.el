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

(defun jjp/not-if-tramp (f)
  ;; call f, but only if we're not connected via tramp
  (when (not (file-remote-p default-directory)) (funcall f)))

(defun jjp/copy-line-or-region ()
  "copies the region if active, the current line if not."
  (interactive)
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position) (line-end-position))))


;; from radian with slight tweaks
;; https://github.com/raxod502/radian/blob/c114b36abb32752e0ed5a3e3a797d4ce60fad92a/emacs/radian.el#L4239
(defun jjp/rename-current-file (newname)
  "Rename file visited by current buffer to NEWNAME.
Interactively, prompt the user for the target filename, with
completion.
If NEWNAME is a directory then extend it with the basename of
`buffer-file-name'. Make parent directories automatically."
  (interactive
   (progn
     (unless buffer-file-name
       (user-error "Current buffer is not visiting a file"))
     (let ((newname (read-file-name "Rename to: " buffer-file-name)))
       (when (equal (file-truename newname)
                    (file-truename buffer-file-name))
         (user-error "%s" "Can't rename a file to itself"))
       (list newname))))
  (unless buffer-file-name
    (error "Current buffer is not visiting a file"))
  (when (equal (file-truename newname)
               (file-truename buffer-file-name))
    (error "%s: %s" "Can't rename a file to itself" newname))
  (when (equal newname (file-name-as-directory newname))
    (setq newname
          (concat newname (file-name-nondirectory buffer-file-name))))
  (make-directory (file-name-directory newname) 'parents)
  ;; Passing integer as OK-IF-ALREADY-EXISTS means prompt for
  ;; confirmation before overwriting. Why? Who can say...
  (dired-rename-file buffer-file-name newname 0))

;; from the wiki http://www.emacswiki.org/emacs/MiniBuffer
(defun jjp/switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

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
