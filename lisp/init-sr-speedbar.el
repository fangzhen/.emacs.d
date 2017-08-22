(require-package 'sr-speedbar)

(setq sr-speedbar-auto-refresh nil)
(setq sr-speedbar-width 25)
(setq sr-speedbar-right-side nil)
(setq speedbar-use-images nil)
(setq speedbar-show-unknown-files t)

(sr-speedbar-open)
(define-key speedbar-file-key-map "\C-m" 'speedbar-toggle-line-expansion)

(provide 'init-sr-speedbar)

