(setq xref-prompt-for-identifier nil)

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

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; Alternative folding provider, can be enabled in mode-hooks
(use-package origami
  :ensure t
  :bind (:map origami-mode-map
         ("C-=" . origami-recursively-toggle-node)
         ("C-+" . origami-toggle-all-nodes)))


(use-package magit
  :ensure t
  :config
  (use-package magit-gerrit
    :ensure t
    :config
    (setq-default magit-gerrit-remote "gerrit")
    (setq-default magit-gerrit-push-to 'for)
    (setq-default magit-gerrit-push-format "refs/%s%s%%topic=%s")
    ))

(provide 'init-prog)
