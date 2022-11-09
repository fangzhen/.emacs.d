(use-package treemacs
  :ensure t
  :hook
  (emacs-startup . (lambda() (if (not (daemonp)) (save-selected-window (treemacs-select-window)))))
  (server-after-make-frame . (lambda() (save-selected-window (treemacs-select-window))))
)
(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)
(provide 'init-treemacs)
