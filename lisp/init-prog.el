(setq xref-prompt-for-identifier nil)

(require-package 'ggtags)
(custom-set-variables
 '(ggtags-auto-jump-to-match nil)
 '(ggtags-sort-by-nearness t)
 )
(defun set-ggtags-mode (s)
  (if s (progn (ggtags-mode 1)
               (define-key ggtags-mode-map "\M-." nil))
    (ggtags-mode 0)))
(use-package flycheck
  :ensure t)
(global-flycheck-mode)

(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-prefer-flymake nil)
  ;; lsp extras
  (use-package lsp-ui
    :ensure t
    :config
    (setq lsp-ui-sideline-ignore-duplicate t)
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    (with-eval-after-load 'lsp-mode
      (add-hook 'lsp-after-open-hook (lambda () (lsp-ui-flycheck-enable 1)))))

  (use-package company-lsp
    :ensure t
    :config
    (push 'company-lsp company-backends))
  (use-package yasnippet :ensure t) ; required by lsp-enable-snippet
  (use-package lsp-treemacs
    :ensure t
    :commands lsp-treemacs-errors-list))

;; Add function to toggle ggtags
;; Turn on: enable ggtages mode for all files in current project
;; Turn off: disable
;; Add flag file to project root
(defun print-to-file (filename data)
  (with-temp-file filename
    (prin1 data (current-buffer))))

(defun read-from-file (filename)
  (with-temp-buffer
    (insert-file-contents filename)
    (cl-assert (eq (point) (point-min)))
    (read (current-buffer))))

(defun read-project-cfg ()
    (let* ((cfgpath (concat (projectile-project-root) ".emacscfg"))
         (project-cfg (if (file-exists-p cfgpath)
                  (read-from-file cfgpath)
                  (make-hash-table :test 'equal))))
      project-cfg))

(defun save-project-cfg (cfg)
  (let* ((cfgpath (concat (projectile-project-root) ".emacscfg")))
    (print-to-file cfgpath cfg)))

(defun toggle-ggtags-project-wide ()
  (interactive)
  (let* ((cfg (read-project-cfg))
         (syntax-backend (if (gethash "syntax-backend" cfg nil) nil "ggtags"))
         (project-root (projectile-project-root)))
    (progn
      (defun toggle-buffer(buf)
        (with-current-buffer buf
          (if (equal (projectile-project-root) project-root)
              (set-ggtags-mode syntax-backend))))
      (puthash "syntax-backend" syntax-backend cfg)
      (save-project-cfg cfg)
      (setq emacs-project-cfg cfg)
      (mapcar 'toggle-buffer (buffer-list)))))

(add-hook 'lsp-after-open-hook
          (lambda ()
            (let* ((cfg (read-project-cfg))
                   (syntax-backend
                    (gethash "syntax-backend" cfg nil)))
              (set-ggtags-mode (if syntax-backend nil t))
              (set-ggtags-mode syntax-backend))))

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

(add-hook 'prog-mode-hook 'linum-mode)

(provide 'init-prog)
