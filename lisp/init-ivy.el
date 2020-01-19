(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :config
  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’. And show full name with path for candidates.
  (setq ivy-use-virtual-buffers t)
  (setq ivy-virtual-abbreviate 'abbreviate)
  ;; number of result lines to display
  (setq ivy-height 10))
(use-package counsel
  :ensure t
  :config
  (counsel-mode 1)
  (use-package smex ; for recent used commands list on top
    :ensure t))
(use-package swiper
  :ensure t
  :bind (:map ivy-mode-map
   ("C-s" . swiper-isearch)))
(provide 'init-ivy)
