(recentf-mode 1)
(setq recentf-max-saved-items 1000
      recentf-exclude '("/tmp/" "/ssh:"))
(add-hook 'find-file-hook 'recentf-save-list)

(save-place-mode 1)

(provide 'init-recentf)
