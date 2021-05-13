(setq desktop-path (list user-emacs-directory)
      desktop-restore-eager 3
      desktop-load-locked-desktop t
      desktop-auto-save-timeout 600)
(desktop-save-mode 1)
(provide 'init-sessions)
