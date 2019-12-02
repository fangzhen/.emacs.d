(require-package 'desktop+)
(require 'desktop+)

;; save a list of open files in ~/.emacs.d/.emacs.desktop
(setq desktop-path (list user-emacs-directory)
      desktop-auto-save-timeout 600)
(desktop-save-mode 1)

(defun desktop+-active-desktop ()
  "Show current active desktop."
  (interactive)
  (message desktop-dirname)
    )


(defadvice desktop-read (around trace-desktop-errors activate)
  (let ((debug-on-error t))
    ad-do-it))

(defun desktop-read-saved (orig-fun &rest dirname)
  (if (file-readable-p "~/.emacs.d/desktops/.saved-desktop")
  (load "~/.emacs.d/desktops/.saved-desktop"))
  (unless (boundp 'saved-desktop-dirname)
    (setq saved-desktop-dirname nil))

  (if (and saved-desktop-dirname (not (and (< 0 (length dirname)) dirname)))
   (funcall orig-fun saved-desktop-dirname)
   (apply orig-fun dirname)
  )
  (advice-remove 'desktop-read #'desktop-read-saved)
)

(defun save-last-desktop ()
  "Save last desktop dir."
  (write-region (format "(setq-default saved-desktop-dirname %S)" desktop-dirname)
   nil
   "~/.emacs.d/desktops/.saved-desktop")
  )

(add-hook 'before-init-hook (advice-add 'desktop-read :around #'desktop-read-saved))
(add-hook 'desktop-after-read-hook 'save-last-desktop)

(provide 'init-sessions)
