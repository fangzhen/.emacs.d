;;; init-face.el --- Configuration for face settings

;;; Commentary:
;;; Code:

(add-hook 'window-setup-hook (lambda () (load-theme 'modus-operandi t)))
(setq font-use-system-font t)

(provide 'init-face)
;;; init-face.el ends here
