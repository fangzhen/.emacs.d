(require-package 'markdown-mode)

(setq auto-mode-alist
      (cons '("\\.\\(md\\|markdown\\)\\'" . markdown-mode) auto-mode-alist))
(setq markdown-command "pandoc -f markdown -t html -s -c ~/.emacs.d/lisp/resources/style.css --mathjax --highlight-style kate")
(add-hook 'markdown-mode (lambda () (whitespace-cleanup-mode nil)))
(provide 'init-markdown)
