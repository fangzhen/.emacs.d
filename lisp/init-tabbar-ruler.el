(require-package 'tabbar-ruler)
(setq tabbar-ruler-global-tabbar t)
(add-hook 'after-init-hook '(lambda () (tabbar-ruler-up)))

(global-set-key [M-left] 'tabbar-backward-tab)
(global-set-key [M-right] 'tabbar-forward-tab)

(provide 'init-tabbar-ruler)
