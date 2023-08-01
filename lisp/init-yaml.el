(use-package yaml-mode
  
  :init
  (add-hook 'yaml-mode-hook  #'origami-mode))

(provide 'init-yaml)
