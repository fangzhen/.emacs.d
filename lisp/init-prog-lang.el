;;; package --- summary
;;; Commentary:
;;; Code:

;; Python
(add-hook 'python-mode-hook #'lsp-deferred)
(require-package 'yapfify)

;;; Go
(require-package 'go-mode)
(add-hook 'go-mode-hook #'lsp-deferred)
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t)
  )
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
(setq
 lsp-gopls-env #s(hash-table
                    data ("GOPROXY" "https://goproxy.io,direct"))
 lsp-clients-go-func-snippet-enabled nil
 lsp-clients-go-gocode-completion-enabled nil
 lsp-gopls-use-placeholders nil
 lsp-enable-snippet nil)

;;; rust
(require-package 'rust-mode)
(add-hook 'rust-mode-hook #'lsp-deferred)
(setq
  rust-format-on-save t
  rust-format-show-buffer nil)

;;; puppet
(require-package 'puppet-mode)

(provide 'init-prog-lang)
;;; init-prog-lang ends here
