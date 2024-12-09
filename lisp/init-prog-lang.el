;;; init-prog-lang.el --- Configuration for programming language modes

;;; Commentary:
;;; Code:

;; Python
(use-package yapfify)
(add-hook 'python-mode-hook #'lsp-ensure)

;; Go
(use-package go-mode
  :config
  (add-hook 'go-mode-hook #'lsp-ensure)
  (add-hook 'go-mode-hook #'lsp-go-mode-hook)
)

;; Rust
(use-package rust-mode
  :config
  (add-hook 'rust-mode-hook #'lsp-ensure)
  (setq rust-format-on-save t)
)

;; Puppet
(use-package puppet-mode)

;; asm, c, c++
(add-hook 'asm-mode-hook #'lsp-ensure)
(add-hook 'c-mode-hook #'lsp-ensure)
(add-hook 'c++-mode-hook #'lsp-ensure)

(defun enable-globalls-for-project ()
  "Enable Globalls for the current project."
  (interactive)
  (setup-lsp-server-project-wide 'c-mode "globalls"))

;; Haskell
(use-package haskell-mode)

;; Dart
(use-package dart-mode)

;; Web
(use-package web-mode)

(use-package typescript-ts-mode
  :mode
  (("\\.ts\\'" . typescript-ts-mode))
  :config
  (add-hook 'typescript-ts-mode-hook #'lsp-ensure)
  (add-hook 'typescript-ts-mode-hook (lambda () (setq-local tab-width typescript-ts-mode-indent-offset)))
)

;; Vue
(define-derived-mode vue-mode typescript-ts-mode "Vue mode")
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
(add-hook 'vue-mode-hook #'lsp-ensure)

;; Lisp
(use-package rainbow-delimiters)
(add-hook 'lisp-data-mode-hook #'rainbow-delimiters-mode)

(provide 'init-prog-lang)
;;; init-prog-lang.el ends here
