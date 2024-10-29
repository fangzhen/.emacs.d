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
  ))
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

;;; dart
(use-package dart-mode)

;;; web
(use-package web-mode)

(use-package typescript-ts-mode
  :mode
  (("\\.ts\\'" . typescript-ts-mode))
  :config
  (add-hook 'typescript-ts-mode-hook #'lsp-ensure)
  (add-hook 'typescript-ts-mode-hook (lambda () (setq-local tab-width typescript-ts-mode-indent-offset)))

)
;;vue
(define-derived-mode vue-mode typescript-ts-mode "Vue mode")
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
(defun vue-eglot-init-options ()
  (let ((tsdk-path (expand-file-name
                    "lib"
                    (string-trim-right (shell-command-to-string "npm list --global --parseable typescript | head -n1"))
                    )))
    `( :typescript ( :tsdk ,tsdk-path)
       :vue (:hybridMode :json-false)
       :completion (:maxItemsToResolve 10)
       )))

(add-to-list 'eglot-server-programs
             `(vue-mode . ("vue-language-server" "--stdio" :initializationOptions ,(vue-eglot-init-options))))
(add-hook 'vue-mode-hook #'lsp-ensure)

;;; lisp
(use-package rainbow-delimiters)
(add-hook 'lisp-data-mode-hook #'rainbow-delimiters-mode)

(provide 'init-prog-lang)
