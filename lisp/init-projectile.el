(require-package 'projectile)
(require-package 'ag)
(projectile-mode)
(define-key projectile-mode-map (kbd "s-,") 'projectile-command-map)

(defun project-relative-buf-name ()
  "Rename buffer name relative to project root."
  (ignore-errors
    (rename-buffer
     (file-relative-name buffer-file-name (projectile-project-root)))))
(add-hook 'find-file-hook #'project-relative-buf-name)

(setq projectile-completion-system 'ivy)

(provide 'init-projectile)
