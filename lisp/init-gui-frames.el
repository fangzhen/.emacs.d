;;; init-gui-frames.el --- Configuration for GUI frames

;;; Commentary:
;;; Code:

;; Suppress GUI features
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

;; Window size and features
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode t))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Default to maximize frame
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(provide 'init-gui-frames)
;;; init-gui-frames.el ends here
