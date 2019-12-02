(use-package ccls
  :ensure t
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls)
           (lsp-deferred))))

(provide 'init-c)
