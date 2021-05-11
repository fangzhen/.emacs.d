(require-package 'company)
(global-company-mode)
(setq company-auto-complete-chars "qazwsxedcrfvtgbyhnujmikolp._-")
(setq company-idle-delay .25)
;; override default color
(defun company-face-tweak ()
  (let ((bg (face-attribute 'default :background)))
  (set-face-attribute 'company-tooltip nil
                      :foreground (face-attribute 'default :foreground)
                      :background (color-lighten-name bg 15))
  (set-face-attribute 'company-scrollbar-bg nil :background (color-lighten-name bg 10))
  (set-face-attribute 'company-scrollbar-fg nil :background (color-lighten-name bg 3))
  (set-face-attribute 'company-tooltip-selection nil :inherit 'default :background (color-lighten-name bg 10))
  (set-face-attribute 'company-tooltip-common nil :inherit 'default)))

;; For the case that the init file runs after the frame has been created
;; Call of emacs without --daemon option.
(add-hook 'emacs-startup-hook 'company-face-tweak)
;; For the case that the init file runs before the frame is created.
;; Call of emacs with --daemon option.
(add-hook 'server-after-make-frame-hook 'company-face-tweak)

(provide 'init-company)
