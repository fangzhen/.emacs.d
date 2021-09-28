;;----------------------------------------------------------------------------
;; Misc config - yet to be placed in separate files
;;----------------------------------------------------------------------------
(require-package 'diminish)

;; Show line number and column number in mode line
(column-number-mode t)
(line-number-mode t)
;; Kill buffer and close its window
(global-set-key (kbd "C-x j") '(lambda (b)
                                 (interactive "bKill Buffer and window")
                                 (with-current-buffer b
                                   (kill-buffer-and-window))))
;; Avoid performance issue for very long line
(global-so-long-mode 1)
;; Use short answer for yes-or-no-p
(setq use-short-answers t)
;; Disable backup totally
(setq make-backup-files nil)
;; Stay synced with disk files
(global-auto-revert-mode t)
;; Disable annoying bell sound
(setq ring-bell-function 'ignore)
;; Tab/space settings
(require-package 'dtrt-indent)
(setq-default
 indent-tabs-mode nil)
(setq
 dtrt-indent-mode t)

(setq
 split-height-threshold 10000
 split-width-threshold 10000
 ;; https://www.emacswiki.org/emacs/SmoothScrolling
 ;; Don't jump half-screen when point move out
 scroll-step 1
 scroll-conservatively most-positive-fixnum
 auto-window-vscroll nil
 ; Goto buffer beginning/end when PgUp/PgDown
 scroll-error-top-bottom t)

;;; Newline behaviour
(global-set-key (kbd "RET") 'newline-and-indent)

;; Use M+n/p to goto next/previous occurence of current symbol.
(require-package 'highlight-symbol)
(add-hook 'text-mode-hook 'highlight-symbol-mode)
(add-hook 'text-mode-hook 'highlight-symbol-nav-mode)

;; Show pairs and auto insert closing delimiters
(show-paren-mode 1)
(electric-pair-mode 1)

;; Performance
;; lsp-mode's advise
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; Shift lines up and down with M-up and M-down. When paredit is enabled,
;; it will use those keybindings. For this reason, you might prefer to
;; use M-S-up and M-S-down, which will work even in lisp modes.
(require-package 'move-dup)
(global-move-dup-mode)

;; Cut/copy the current line if no region is active
(require-package 'whole-line-or-region)
(whole-line-or-region-global-mode t)
(diminish 'whole-line-or-region-mode)

;; Display available keybindings
(require-package 'which-key)
(which-key-mode 1)
(diminish 'which-key-mode)

;; Rectangle editing
(cua-selection-mode t)

;; Whitespaces
;; Show tab and trailing whitespaces
(global-whitespace-mode t)
(setq whitespace-style '(face trailing tabs tab-mark))
;; Remove trailing whitespaces on modified lines
(require-package 'ws-butler)
(ws-butler-global-mode)
(setq ws-butler-keep-whitespace-before-point nil)
;; use ansi-term without prompt
;; Switch to terminal in other window
;; If ansi-term buffer exists, use it instead of create a new one.
(global-set-key (kbd "s-t") (lambda () (interactive)
                              (if (get-buffer "*ansi-term*")
                                  (switch-to-buffer-other-window "*ansi-term*")
                                (let ((buf (ansi-term "bash")))
                                  (switch-to-buffer (other-buffer buf))
                                  (switch-to-buffer-other-window buf)))))

(defun copy-buffer-name ()
  "Copy buffer name to clipboard."
  (interactive)
  (let ((bname (buffer-name)))
    (with-temp-buffer
      (insert bname)
      (clipboard-kill-region (point-min) (point-max))))
  (message "Buffer name copied to clipboard"))
(global-set-key [mode-line mouse-3] 'copy-buffer-name)

;; Don't open scratch buffer. Use ~/scratch.org instead
(setq inhibit-startup-screen t
      initial-buffer-choice  nil)
(add-hook 'emacs-startup-hook
          (lambda ()
            (if (not (cl-remove-if-not 'buffer-file-name (buffer-list)))
                (find-file "~/scratch.org"))
            (if (get-buffer "*scratch*")
                (kill-buffer "*scratch*"))))
(add-hook 'server-after-make-frame-hook (lambda ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*"))))

;; org-mode
(setq org-support-shift-select t)
(provide 'init-misc)
