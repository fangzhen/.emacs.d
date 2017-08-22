(require-package 'desktop+)
(desktop-save-mode 1)

(require 'desktop+)
(desktop+-add-handler 'speedbar-buffer
  (lambda ()
    (eq (current-buffer) speedbar-buffer))

  (lambda ()
    `(:dir ,default-directory))

  (lambda (name &rest args)
    (sr-speedbar-open)
    (with-current-buffer
        (get-buffer name)
      (setq default-directory (plist-get args :dir))
      (speedbar-update-contents))))


(setq desktop+-special-buffer-handlers
  '(speedbar-buffer)
  )

(defun desktop+-active-desktop ()
  "Show current active desktop."
  (interactive)
  (message desktop-dirname)
    )

(provide 'init-desktop)
