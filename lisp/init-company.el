(require-package 'company)
(global-company-mode)
(setq company-auto-complete-chars "qazwsxedcrfvtgbyhnujmikolp._-")
(setq company-idle-delay .25)

;; match candidates ignoring case except dabbrev
(setq completion-ignore-case t)

;; abbrev backend setting
;; Don't always lowercase candidates when use dabbrev backend.
(setq company-dabbrev-ignore-case nil)
(setq company-dabbrev-downcase nil)

;; show quick-access hints: use M+hint to select
(setq company-show-quick-access 'right)

(setq company-require-match nil)

;; Customize to allow '(' as seperator of filename
;; See the third regexp which added `\(` to original.
(setq company-files--regexps
  (let* ((root (if (eq system-type 'windows-nt)
                   "[a-zA-Z]:/"
                 "/"))
         (begin (concat "\\(?:\\.\\{1,2\\}/\\|~/\\|" root "\\)")))
    (list (concat "\"\\(" begin "[^\"\n]*\\)")
          (concat "\'\\(" begin "[^\'\n]*\\)")
          (concat "\\(?:[ \t=\[\(]\\|^\\)\\(" begin "[^ \t\n]*\\)"))))
;; orig   (concat "\\(?:[ \t=\[  ]\\|^\\)\\(" begin "[^ \t\n]*\\)"))))
(provide 'init-company)
