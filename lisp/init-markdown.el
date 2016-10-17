(require-package 'markdown-mode)

(setq auto-mode-alist
      (cons '("\\.\\(md\\|markdown\\)\\'" . gfm-mode) auto-mode-alist))
(setq markdown-command "pandoc -f markdown -t html -s -c ~/.emacs.d/lisp/resources/style.css --mathjax --highlight-style kate")
;(setq markdown-command "multimarkdown")
(add-hook 'markdown-mode (lambda () (whitespace-cleanup-mode 0)))
(add-hook 'gfm-mode (lambda () (whitespace-cleanup-mode 0)))
(setq markdown-gfm-use-electric-backquote nil)

;(require 'mmm-mode)

;(defun my-mmm-markdown-auto-class (lang &optional submode)
;  "Define a mmm-mode class for LANG in `markdown-mode' using SUBMODE.
;If SUBMODE is not provided, use `LANG-mode' by default."
;  (let ((class (intern (concat "markdown-" lang)))
;        (submode (or submode (intern (concat lang "-mode"))))
;        (front (concat "^```" "[ \t]*" lang "[\n\r]+"))
;        (back "^```"))
;    (mmm-add-classes (list (list class :submode submode :front front :back back)))
;    (mmm-add-mode-ext-class 'markdown-mode nil class)
;    (mmm-add-mode-ext-class 'gfm-mode nil class)))

;;; Mode names that derive directly from the language name
;(mapc 'my-mmm-markdown-auto-class
;       '("awk" "bibtex" "c" "cpp" "css" "html" "java" "latex" "lisp" "makefile"
;               "markdown" "python" "r" "ruby" "sql" "stata" "xml"))
;;; Mode names that differ from the language name
;(my-mmm-markdown-auto-class "fortran" 'f90-mode)
;(my-mmm-markdown-auto-class "perl" 'cperl-mode)
;(my-mmm-markdown-auto-class "shell" 'shell-script-mode)
;; conf-mode defined keymap "C-c C-c" which conflicts
;;(my-mmm-markdown-auto-class "ini" 'conf-mode)

(provide 'init-markdown)
