(require 'flycheck)

;; I have no idea what these are for
;; but I'm not about to delete them
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(defun flycheck-mode-if-not-remote ()
  (unless (file-remote-p default-directory)
    (flycheck-mode)))

(provide 'setup-flycheck)
