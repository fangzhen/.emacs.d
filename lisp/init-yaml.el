(use-package yaml-mode
  :ensure t
  :init
  (add-hook 'yaml-mode-hook  #'origami-mode))

(provide 'init-yaml)
