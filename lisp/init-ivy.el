(use-package ivy
  :diminish (ivy-mode . "")
  :config
  (ivy-mode 1)
  ;; add ‘recentf-mode’ and bookmarks to ‘ivy-switch-buffer’. And show full name with path for candidates.
  (setq ivy-use-virtual-buffers t)
  (setq ivy-virtual-abbreviate 'abbreviate)
  (setq ivy-use-selectable-prompt t)
  ;; number of result lines to display
  (setq ivy-height 10))
(use-package counsel
  :config
  (counsel-mode 1)
  (use-package smex ; for recent used commands list on top
    ))
(use-package swiper
  :bind (:map ivy-mode-map
   ("C-s" . swiper-isearch)))
(provide 'init-ivy)
