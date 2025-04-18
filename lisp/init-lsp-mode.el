;;; init-lsp-mode.el --- Configuration for LSP mode

;;; Commentary:
;;; Code:

(setq xref-prompt-for-identifier nil)

(defun disable-project-lsp-server (disabled-servers)
  (let ((file (expand-file-name ".dir-locals.el" (projectile-project-root))))
    (find-file file)
    (if disabled-servers
        (add-dir-local-variable
         nil 'lsp-disabled-clients disabled-servers)
      (delete-dir-local-variable nil 'lsp-disabled-clients))
    (save-buffer)
    (kill-current-buffer)))

;; lsp-mode seems to work better with flycheck
(use-package flycheck)
(global-flycheck-mode)

(use-package lsp-mode
  :config
  (setq lsp-auto-configure t)
  ;; register globalls with high priority
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "globalls")
                    :major-modes '(c-mode c++-mode objc-mode asm-mode cuda-mode)
                    :priority -10
                    :server-id 'globalls))
  (add-to-list 'lsp-language-id-configuration '(asm-mode . "asm"))
  (use-package lsp-ui
    :config
    (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
    (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
    (define-key lsp-ui-mode-map (kbd "C-.") 'lsp-ui-peek-find-implementation))
  (use-package lsp-treemacs)
  (use-package lsp-ivy)
  (use-package lsp-pyright
    :init
    (setq lsp-pyright-multi-root nil) ; To invoke seperate pyright for each project. see https://github.com/emacs-lsp/lsp-pyright/issues/66
    )
  )


(defun lsp-ensure() (lsp-deferred))

(defun disable-lsp-server-project-wide (disabled-servers)
  (interactive)
  (defun reload-buffer(buf)
    (with-current-buffer buf
      (if (and (equal (projectile-project-root) project-root)
               (symbol-value lsp-mode))
          (progn
            (hack-dir-local-variables-non-file-buffer)
            (lsp-disconnect)
            (lsp-deferred)
            ))))
  (let* ((project-root (projectile-project-root)))
    (disable-project-lsp-server disabled-servers)
    (mapcar 'reload-buffer (buffer-list))))

;; language-specific configs
(defun lsp-go-mode-hook ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t)
  (setq
   lsp-gopls-env #s(hash-table
                    data ("GOPROXY" "https://goproxy.io,direct"))
   lsp-clients-go-func-snippet-enabled nil
   lsp-clients-go-gocode-completion-enabled nil
   lsp-gopls-use-placeholders nil
   lsp-enable-snippet nil))

(provide 'init-lsp-mode)
;;; init-lsp-mode.el ends here
