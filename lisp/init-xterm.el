;;; init-xterm.el --- Configuration for xterm settings

;;; Commentary:
;;; Code:

;; settings when emacs is running in xterm
(unless (display-graphic-p)
  (xterm-mouse-mode t)
)

(provide 'init-xterm)
;;; init-xterm.el ends here
