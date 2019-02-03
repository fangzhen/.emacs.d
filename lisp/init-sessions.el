(require-package 'desktop+)
(require 'desktop+)

;; save a list of open files in ~/.emacs.d/.emacs.desktop
(setq desktop-path (list user-emacs-directory)
      desktop-auto-save-timeout 600)
(desktop-save-mode 1)

(desktop+-add-handler 'speedbar-buffer
  (lambda ()
    (eq (current-buffer) speedbar-buffer))

  (lambda ()
    `(:dir, default-directory,
    :sr-speedbar-enabled, (sr-speedbar-exist-p)))

  (lambda (name &rest args)
    (if (plist-get args :sr-speedbar-enabled)
        (progn
          (sr-speedbar-open)
          (with-current-buffer
              (get-buffer name)
            (setq default-directory (plist-get args :dir))
            (speedbar-update-contents)))
      )
    )
  )


(setq desktop+-special-buffer-handlers
  '(speedbar-buffer)
  )

(defun desktop+-active-desktop ()
  "Show current active desktop."
  (interactive)
  (message desktop-dirname)
    )


(defadvice desktop-read (around trace-desktop-errors activate)
  (let ((debug-on-error t))
    ad-do-it))

(defadvice desktop-read (around time-restore activate)
    (let ((start-time (current-time)))
      (prog1
          ad-do-it
        (message "Desktop restored in %.2fms"
                 (sanityinc/time-subtract-millis (current-time)
                                                 start-time)))))

(defadvice desktop-create-buffer (around time-create activate)
  (let ((start-time (current-time))
        (filename (ad-get-arg 1)))
    (prog1
        ad-do-it
      (message "Desktop: %.2fms to restore %s"
               (sanityinc/time-subtract-millis (current-time)
                                               start-time)
               (when filename
		 (abbreviate-file-name filename))))))

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

(setq desktop-globals-to-save
      (append '((comint-input-ring        . 50)
                (compile-history          . 30)
                desktop-missing-file-warning
		sr-speedbar-width
		default-directory
                (dired-regexp-history     . 20)
                (extended-command-history . 30)
                (face-name-history        . 20)
                (file-name-history        . 100)
                (grep-find-history        . 30)
                (grep-history             . 30)
                (ido-buffer-history       . 100)
                (ido-last-directory-list  . 100)
                (ido-work-directory-list  . 100)
                (ido-work-file-list       . 100)
                (magit-read-rev-history   . 50)
                (minibuffer-history       . 50)
                (org-clock-history        . 50)
                (org-refile-history       . 50)
                (org-tags-history         . 50)
                (query-replace-history    . 60)
                (read-expression-history  . 60)
                (regexp-history           . 60)
                (regexp-search-ring       . 20)
                register-alist
                (search-ring              . 20)
                (shell-command-history    . 50)
                tags-file-name
                tags-table-list)))

(provide 'init-sessions)
