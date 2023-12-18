;; settings when emacs is running in xterm
(unless (display-graphic-p)
  (xterm-mouse-mode t)
  )
(provide 'init-xterm)
