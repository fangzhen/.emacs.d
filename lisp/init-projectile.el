(require-package 'projectile)
(require-package 'ag)
(projectile-mode)
(define-key projectile-mode-map (kbd "s-,") 'projectile-command-map)

(provide 'init-projectile)
