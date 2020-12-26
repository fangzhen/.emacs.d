(setq desktop-path (list user-emacs-directory)
      desktop-restore-eager 3
      desktop-auto-save-timeout 600)
(desktop-save-mode 1)
(if (get-buffer "*scratch*")
    (kill-buffer "*scratch*"))
(provide 'init-sessions)
