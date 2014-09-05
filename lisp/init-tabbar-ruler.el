(require-package 'tabbar-ruler)
(setq tabbar-ruler-global-tabbar t)
(add-hook 'after-init-hook '(lambda () (tabbar-ruler-up)))

(provide 'init-tabbar-ruler)
