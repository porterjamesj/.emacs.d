(require 'mingus)

(defadvice mingus-next (after goto-song ())
  "Goto current song after next"
  (mingus-goto-current-song))
(ad-activate 'mingus-next)

(defadvice mingus-prev (after goto-song ())
  "Goto current song after prev"
  (mingus-goto-current-song))
(ad-activate 'mingus-prev)

(defadvice mingus (after organize ())
  "Refresh and goto current song after
entering mingus."
  (mingus-refresh)
  (mingus-goto-current-song))
(ad-activate 'mingus)

;; mingus specific keybinds

(global-set-key (kbd "C-c v") 'mpd-set-volume)
(global-set-key (kbd "C-c m") 'mingus)


(provide 'setup-mingus)
