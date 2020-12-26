(require-package 'company)
(global-company-mode)
(setq company-auto-complete-chars "qazwsxedcrfvtgbyhnujmikolp._-")
(setq company-idle-delay .25)
;; override default color
(let ((bg (face-attribute 'default :background)))
  (set-face-attribute 'company-tooltip nil
                      :foreground (face-attribute 'default :foreground)
                      :background (color-lighten-name bg 15))
  (set-face-attribute 'company-scrollbar-bg nil :background (color-lighten-name bg 10))
  (set-face-attribute 'company-scrollbar-fg nil :background (color-lighten-name bg 3))
  (set-face-attribute 'company-tooltip-selection nil :inherit 'default :background (color-lighten-name bg 10))
  (set-face-attribute 'company-tooltip-common nil :inherit 'default))

(provide 'init-company)
