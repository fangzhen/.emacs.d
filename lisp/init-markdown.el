(require-package 'markdown-mode)

(setq auto-mode-alist
      (cons '("\\.\\(md\\|markdown\\)\\'" . gfm-mode) auto-mode-alist))
(setq markdown-command "pandoc -f markdown -t html -s -c ~/.emacs.d/lisp/resources/style.css --mathjax --highlight-style kate")
(setq markdown-gfm-use-electric-backquote nil)

(provide 'init-markdown)
