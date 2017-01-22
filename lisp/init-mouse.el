(mouse-wheel-mode 1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;;(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(global-unset-key [S-mouse-1])
(global-unset-key [S-down-mouse-1])
(global-unset-key [M-mouse-3])

(provide 'init-mouse)
