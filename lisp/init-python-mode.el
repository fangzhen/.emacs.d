(require-package 'elpy)

(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
		("SConscript\\'" . python-mode))
              auto-mode-alist))
(custom-set-variables '(elpy-modules
   (quote
     (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-django elpy-module-sane-defaults))))
(elpy-enable)

(after-load 'elpy
(define-key elpy-mode-map (kbd "C-<tab>") 'elpy-company-backend)
(global-set-key [S-mouse-1] 'elpy-goto-definition)

(define-key elpy-mode-map (kbd "<M-down>") nil)
(define-key elpy-mode-map (kbd "<M-up>") nil)
(define-key elpy-mode-map (kbd "<M-left>") nil)
(define-key elpy-mode-map (kbd "<M-right>") nil)
)

(provide 'init-python-mode)
