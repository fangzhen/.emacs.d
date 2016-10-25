(require-package 'hideshowvis)
(autoload 'hideshowvis-enable "hideshowvis" "Highlight foldable regions")

(autoload 'hideshowvis-minor-mode
  "hideshowvis"
  "Will indicate regions foldable with hideshow in the fringe."
  'interactive)

(dolist (hook (list 'emacs-lisp-mode-hook
                    'python-mode-hook
                    'c++-mode-hook))
(add-hook hook 'hideshowvis-enable))

(provide 'init-hideshowvis)

