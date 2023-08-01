(use-package treemacs
  
  :hook
  (emacs-startup . (lambda() (if (not (daemonp)) (save-selected-window (treemacs-select-window)))))
  (server-after-make-frame . (lambda() (save-selected-window (treemacs-select-window))))
)
(use-package treemacs-projectile
  :after treemacs projectile
  )
(provide 'init-treemacs)
