(setq xref-prompt-for-identifier nil)

(use-package diff-hl
  :init
  (add-hook 'prog-mode-hook 'diff-hl-mode)
  (add-hook 'prog-mode-hook 'highlight-symbol-mode)
  (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
  (add-hook 'vc-dir-mode-hook 'diff-hl-mode)
  )

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
  :bind (:map origami-mode-map
         ("C-=" . origami-recursively-toggle-node)
         ("C-+" . origami-toggle-all-nodes)))


(use-package magit)

(provide 'init-prog)
