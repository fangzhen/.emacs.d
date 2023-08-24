;;; package --- summary
;;; Commentary:
;;; Code:

;; TODO(fangzhen) if this works well, remove hooks for specific modes;
(add-hook 'prog-mode-hook 'lsp-ensure)

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

;;; asm
(add-hook 'asm-mode-hook #'lsp-ensure)

(provide 'init-prog-lang)

;;; haskell
(use-package haskell-mode)
