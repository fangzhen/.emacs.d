(require-package 'tabbar-ruler)
(setq tabbar-ruler-global-tabbar t)
(add-hook 'after-init-hook '(lambda () (tabbar-ruler-up)))

(global-set-key (kbd "C-`") 'tabbar-forward-tab)
(global-set-key (kbd "C-~") 'tabbar-backward-tab)
(global-set-key (kbd "C-<escape>") 'tabbar-backward-tab)

(provide 'init-tabbar-ruler)
