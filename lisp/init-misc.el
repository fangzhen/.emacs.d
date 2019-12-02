;;----------------------------------------------------------------------------
;; Misc config - yet to be placed in separate files
;;----------------------------------------------------------------------------
;; Show line number and column number on mode line
(require-package 'diminish)

;; Show line number and column number in mode line
(column-number-mode t)
(line-number-mode t)
;; Kill buffer and close its window
(global-set-key (kbd "C-x j") '(lambda (b)
                                 (interactive "bKill Buffer and window")
                                 (with-current-buffer b
                                   (kill-buffer-and-window))))
(setq
 indent-tabs-mode nil
 split-height-threshold 120
 split-width-threshold 100
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

;; Shift lines up and down with M-up and M-down. When paredit is enabled,
;; it will use those keybindings. For this reason, you might prefer to
;; use M-S-up and M-S-down, which will work even in lisp modes.
(require-package 'move-dup)
(global-set-key [M-up] 'md-move-lines-up)
(global-set-key [M-down] 'md-move-lines-down)
(global-set-key [M-S-up] 'md-move-lines-up)
(global-set-key [M-S-down] 'md-move-lines-down)
(global-set-key (kbd "C-c p") 'md-duplicate-down)

;; Cut/copy the current line if no region is active
(require-package 'whole-line-or-region)
(whole-line-or-region-mode t)
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
(provide 'init-misc)
