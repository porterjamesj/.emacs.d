(require 'tramp)

(setq tramp-default-method "ssh")
;; proxy through sully to get to cloud instances
;; this depends on some junk in my ssh config that
;; sets sully up correctly
(add-to-list 'tramp-default-proxies-alist
             '(".*-ins$"
               nil ;; <- this could be set to ubuntu but I would rather
                   ;; rely on sully's ssh config for this
               "/ssh:sully:"))

(provide 'setup-tramp)
