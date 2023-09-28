;;; package --- summary
;;; Commentary:
;;; Code:

;; Python
(use-package yapfify
  )
(add-hook 'python-mode-hook #'lsp-ensure)

;;; Go
(use-package go-mode
  :config
  (add-hook 'go-mode-hook #'lsp-ensure)
  (add-hook 'go-mode-hook #'lsp-go-mode-hook)
  )
;;; rust
(use-package rust-mode
  :config
  (add-hook 'rust-mode-hook #'lsp-ensure)
  (setq
   rust-format-on-save t
   rust-format-show-buffer nil)
  )
;;; puppet
(use-package puppet-mode)

;;; asm, c, c++
(add-hook 'asm-mode-hook #'lsp-ensure)
(add-hook 'c-mode-hook #'lsp-ensure)
(add-hook 'c++-mode-hook #'lsp-ensure)

(defun enable-globalls-for-project ()
  (interactive)
  (setup-lsp-server-project-wide 'c-mode "globalls"))

;;; haskell
(use-package haskell-mode)

(provide 'init-prog-lang)
