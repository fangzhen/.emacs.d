(require-package 'projectile)
(require-package 'ag)
(projectile-mode)
(define-key projectile-mode-map (kbd "s-,") 'projectile-command-map)

(defun abbreviate-buf-name ()
  "Rename buffer name relative to abbreviate file name."
  (ignore-errors
    (rename-buffer
     (abbreviate-file-name buffer-file-name ))))
(add-hook 'find-file-hook #'abbreviate-buf-name)

(setq projectile-completion-system 'ivy)

(provide 'init-projectile)
