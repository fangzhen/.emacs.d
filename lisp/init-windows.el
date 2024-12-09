;;; init-windows.el --- Configuration for window management
;;; Commentary:
;;; Code:
(global-set-key (kbd "M-<escape>") 'other-window)
(global-set-key (kbd "s-<escape>") (lambda() (interactive) (other-window -1)))

(global-set-key (kbd "C-S-h")  'windmove-left)
(global-set-key (kbd "C-S-l") 'windmove-right)
(global-set-key (kbd "C-S-k")    'windmove-up)
(global-set-key (kbd "C-S-j")  'windmove-down)

(use-package auto-dim-other-buffers
  :hook (after-init . auto-dim-other-buffers-mode ))

;; Rearrange split windows
(defun split-window-func-with-other-buffer (split-function)
  (lexical-let ((s-f split-function))
    (lambda ()
      (interactive)
      (funcall s-f)
      (set-window-buffer (next-window) (other-buffer)))))

(defun split-window-horizontally-instead ()
  "Split window horizontally and set other buffer."
  (interactive)
  (save-excursion
    (delete-other-windows)
    (funcall (split-window-func-with-other-buffer 'split-window-horizontally))))

(defun split-window-vertically-instead ()
  "Split window vertically and set other buffer."
  (interactive)
  (save-excursion
    (delete-other-windows)
    (funcall (split-window-func-with-other-buffer 'split-window-vertically))))

(global-set-key "\C-x\\" 'split-window-horizontally-instead)
(global-set-key "\C-x-" 'split-window-vertically-instead)

(provide 'init-windows)
;;; init-windows.el ends here
