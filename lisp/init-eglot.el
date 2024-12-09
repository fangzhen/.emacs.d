;;; init-eglot.el --- Configuration for Eglot

;;; Commentary:
;;; Code:

(use-package eglot
  :init
  ;; Disable inlay hint. A little annoying for me.
  (setq eglot-ignored-server-capabilities '(:inlayHintProvider))
  :config
  ;; event buffer could cause bad performance
  (setq eglot-events-buffer-size nil)
  ;; Flymake getting clobbered by doclets/types in Eldoc:
  ;; https://github.com/joaotavora/eglot/issues/889
  (add-hook 'eglot-managed-mode-hook
            #'(lambda ()
                (setq-local eldoc-documentation-strategy
                            #'eldoc-documentation-compose)))
  (add-to-list 'eglot-server-programs
               `((c-mode c++-mode)
                 . ,(eglot-alternatives
                     '("clangd" "ccls" "globalls"))))
  (add-to-list 'eglot-server-programs
               '(asm-mode . ("globalls")))
  (defun vue-eglot-init-options ()
    (let ((tsdk-path (expand-file-name
                      "lib"
                      (string-trim-right (shell-command-to-string "npm list --global --parseable typescript | head -n1"))
                      )))
      `( :typescript ( :tsdk ,tsdk-path)
         :vue (:hybridMode :json-false)
         )))
  (add-to-list 'eglot-server-programs
               `(vue-mode . ("vue-language-server" "--stdio" :initializationOptions ,(vue-eglot-init-options))))
)

;; language-specific configs
(defun lsp-go-mode-hook ()
  (add-hook 'before-save-hook #'eglot-format-buffer 0 t)
  (setenv "GOPROXY" '"https://goproxy.io,direct")
)

(defun customize-lsp-servers ()
  ;; dir-local.el is loaded after mode-hooks.
  ;; Load dir-local variables manually.
  (hack-dir-local-variables-non-file-buffer)
  (if (boundp 'custom-lsp-servers)
      (if (not (local-variable-p 'eglot-server-programs))
          (progn
            (make-local-variable 'eglot-server-programs)
            (setq eglot-server-programs (append custom-lsp-servers eglot-server-programs))
            ))))

;; only auto-start eglot inside projectile projects
(defun lsp-ensure()
  (if (projectile-project-p) (progn (customize-lsp-servers) (eglot-ensure))))

(defun setup-lsp-server-project-wide (mode server)
  (if (not (boundp 'custom-lsp-servers))
      (setq-local custom-lsp-servers ()))
  (add-to-list 'custom-lsp-servers (list mode server))
  (projectile-add-dir-local-variable nil . ('custom-lsp-servers custom-lsp-servers))

  (message "You need to restart eglot to make new lsp-server take effect for current session. Try `'eglot-shutdown`' then `'eglot`'")
)

;(setup-lsp-server-project-wide 'c-mode "globallss")
(provide 'init-eglot)
;;; init-eglot.el ends here
