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

;; lsp-ui didn't work well with flymake now(2020.12)
(use-package flycheck
  :ensure t)
(global-flycheck-mode)

(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-auto-configure t)
  ;; register globalls with high priority
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "globalls")
                    :major-modes '(c-mode c++-mode objc-mode)
                    :priority -10
                    :server-id 'globalls))
  (use-package lsp-ui
    :ensure t
    :config
    (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
    (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))
  (use-package lsp-treemacs
    :ensure t))

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

(require-package 'diff-hl)
(add-hook 'prog-mode-hook 'diff-hl-mode)
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
(add-hook 'vc-dir-mode-hook 'diff-hl-mode)

;; Folding configs
(setq hs-hide-show-all-next nil)
(defun hs-toggle-hiding-all ()
  "Hide or show all blocks."
  (interactive)
  (if hs-hide-show-all-next
      (hs-show-all)
    (hs-hide-all))
  (setq-local hs-hide-show-all-next (not hs-hide-show-all-next)))
(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'hs-minor-mode-hook
          (lambda ()
            (define-key hs-minor-mode-map (kbd "C-=") 'hs-toggle-hiding)
            (define-key hs-minor-mode-map (kbd "C-+") 'hs-toggle-hiding-all)))

(use-package origami
  :ensure t
  :bind (:map origami-mode-map
         ("C-=" . origami-recursively-toggle-node)
         ("C-+" . origami-toggle-all-nodes)))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(provide 'init-prog)
