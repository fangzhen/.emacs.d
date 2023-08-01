(use-package projectile
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode)
  (define-key projectile-mode-map (kbd "s-,") 'projectile-command-map)
  )
(use-package ag)

(defun abbreviate-buf-name ()
  "Rename buffer name relative to abbreviate file name."
  (ignore-errors
    (rename-buffer
     (abbreviate-file-name buffer-file-name ))))
(add-hook 'find-file-hook #'abbreviate-buf-name)


(provide 'init-projectile)
