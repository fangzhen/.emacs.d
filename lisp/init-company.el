(require-package 'company)
(global-company-mode)
(setq company-auto-complete-chars "qazwsxedcrfvtgbyhnujmikolp._-")
(setq company-idle-delay .25)
;; Don't always lowercase candidates when use dabbrev backend.
(setq company-dabbrev-downcase nil)

(provide 'init-company)
