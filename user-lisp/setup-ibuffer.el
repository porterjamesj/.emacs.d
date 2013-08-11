(setq ibuffer-saved-filter-groups
      '(("default"
         ("Mingus" ;; mingus buffers
          (name . "Mingus"))
         ("Magit" ;; magit buffers
          (name . "magit")))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'setup-ibuffer)
