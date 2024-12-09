;;; init-yaml.el --- Configuration for YAML mode

;;; Commentary:
;;; Code:

(use-package yaml-mode
  :init
  (add-hook 'yaml-mode-hook #'origami-mode))

(provide 'init-yaml)
;;; init-yaml.el ends here
