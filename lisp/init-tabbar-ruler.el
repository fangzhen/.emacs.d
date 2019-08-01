(require-package 'tabbar-ruler)
(setq tabbar-ruler-global-tabbar t)
(tabbar-ruler-up)
(tabbar-ruler-group-by-projectile-project)

(global-set-key (kbd "C-`") 'tabbar-forward-tab)
(global-set-key (kbd "C-~") 'tabbar-backward-tab)
(global-set-key (kbd "C-<escape>") 'tabbar-backward-tab)

(provide 'init-tabbar-ruler)
