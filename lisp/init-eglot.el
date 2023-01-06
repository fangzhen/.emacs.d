;; https://github.com/joaotavora/eglot/issues/889
(use-package eglot
  :config
  (add-hook 'eglot-managed-mode-hook
          #'(lambda ()
              (setq-local eldoc-documentation-strategy
                          #'eldoc-documentation-compose)))
  )

;; language-specific configs
(defun lsp-go-mode-hook ()
  (add-hook 'before-save-hook #'eglot-format-buffer 0 t)
  (setenv "GOPROXY" '"https://goproxy.io,direct")
  )

;; only auto-start eglot inside projectile projects
(defun lsp-ensure() (if (projectile-project-p) (eglot-ensure)))
;; TODO
(defun disable-lsp-server-project-wide (disabled-servers)
  (interactive)
)
(provide 'init-eglot)
