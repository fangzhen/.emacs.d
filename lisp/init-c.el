
(use-package ccls
  :ensure t
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls)
           (lsp-deferred))))

(defun enable-c-mode-globalls ()
  (interactive)
  (disable-lsp-server-project-wide '(clangd ccls)))

(defun disable-c-mode-globalls ()
  (interactive)
  (disable-lsp-server-project-wide '(globalls)))

(provide 'init-c)
