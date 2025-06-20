;;; init-misc.el --- Miscellaneous configurations

;;; Commentary:
;;; Code:

;; Show line number and column number in mode line
(column-number-mode t)
(line-number-mode t)

;; Enable hl-line-mode for most modes, but not all (e.g. vterm-mode).
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'text-mode-hook #'hl-line-mode)

(blink-cursor-mode t)

;; Kill buffer and close its window
(global-set-key (kbd "C-x j") #'(lambda (b)
                                 (interactive "bKill Buffer and window")
                                 (with-current-buffer b
                                   (kill-buffer-and-window))))

;; Use short answer for yes-or-no-p
(setq use-short-answers t)

;; Disable backup totally
(setq make-backup-files nil)

;; Stay synced with disk files
(global-auto-revert-mode t)

;; Disable annoying bell sound
(setq ring-bell-function 'ignore)

;; Tab/space settings
(use-package dtrt-indent
  :init
  (setq-default indent-tabs-mode nil)
  (setq dtrt-indent-mode t)
)

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

;; Use M+n/p to goto next/previous occurrence of current symbol.
(use-package highlight-symbol
  :hook
  (text-mode-hook . highlight-symbol-mode)
  (text-mode-hook . highlight-symbol-nav-mode)
)

;; Auto insert closing delimiters
(electric-pair-mode 1)

;; Performance
;; lsp-mode's advise
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; Shift lines up and down with M-up and M-down. When paredit is enabled,
;; it will use those keybindings. For this reason, you might prefer to
;; use M-S-up and M-S-down, which will work even in lisp modes.
(use-package move-dup
  :config
  (global-move-dup-mode)
)

;; Cut/copy the current line if no region is active
(use-package whole-line-or-region
  :config
  (whole-line-or-region-global-mode t)
  :diminish whole-line-or-region-mode
)

;; Display available keybindings
(use-package which-key
  :config
  (which-key-mode 1)
  (setq which-key-popup-type 'minibuffer) ;; the default value in emacs 30.1 makes fcitx lost focus.
  :diminish which-key-mode
)

;; Rectangle editing
(cua-selection-mode t)

(defun yank-primary-selection ()
  "Yank the primary selection."
  (interactive)
  (let ((primary (gui-get-primary-selection)))
    (insert-for-yank primary)))
(global-set-key (kbd "S-<insert>") 'yank-primary-selection)

;; Whitespaces
;; Show tab and trailing whitespaces
(global-whitespace-mode t)
(setq whitespace-style '(face trailing tabs tab-mark))

;; Remove trailing whitespaces on modified lines
(use-package ws-butler
  :config
  (ws-butler-global-mode)
  :init
  (setq ws-butler-keep-whitespace-before-point nil)
)

;; Use ansi-term without prompt
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

;; Use scratch.org instead of *scratch*
(defun setup_scratch (daemon)
  "Setup scratch buffer behavior."
  (if (and (not daemon) (not (cl-remove-if-not 'buffer-file-name (buffer-list))))
      (find-file "~/scratch.org"))
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'emacs-startup-hook (lambda () (setup_scratch (daemonp))))
(add-hook 'server-after-make-frame-hook (lambda () (setup_scratch nil)))

;; Disable mouse-highlight for clickable text and only follow link on mouse-2
;; These configs make a reasonable mouse selection behavior.
(setq mouse-highlight nil)
(setq mouse-1-click-follows-link nil)

(use-package pdf-tools
  :config
  (pdf-tools-install t)
)

;; Use vterm and allow multiple vterm buffers
(use-package vterm)
(use-package multi-vterm)

;; wayland version didn't paste correctly from X applications.
(set-selection-coding-system 'utf-8)

(provide 'init-misc)
;;; init-misc.el ends here
