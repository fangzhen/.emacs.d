;;; init-c.el --- Configuration for C/C++ modes

;;; Commentary:
;;; Code:

(use-package ccls
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls)
           (lsp-deferred))))

(defun enable-c-mode-globalls ()
  "Enable Globalls for C/C++ modes."
  (interactive)
  (disable-lsp-server-project-wide '(clangd ccls)))

(defun disable-c-mode-globalls ()
  "Disable Globalls for C/C++ modes."
  (interactive)
  (disable-lsp-server-project-wide '(globalls)))

(provide 'init-c)
;;; init-c.el ends here
