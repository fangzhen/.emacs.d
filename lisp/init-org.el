(setq org-CUA-compatible t)
(require 'org)
(setq org-link-descriptive nil)
(setq org-support-shift-select t)
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t))) ; this line activates dot

(require 'ox-beamer)
(defun org-beamer-export-to-pdf-async () (interactive) (org-beamer-export-to-pdf t))
(defun org-latex-export-to-pdf-async () (interactive) (org-latex-export-to-pdf t))

(require 'ox-publish)
;;To publish a project using org-mode, org-publish-project-alist need to be set.
;; Here's an exmaple using .dir-locals.el to setup org-mode publish in a projectile project
;; without hardcoded absolute path.
;;
;;((org-mode
;;  .
;;  ((eval .
;;         (setq-local
;;          org-publish-project-alist
;;          `(
;;            ("doc" :components ("doc-org" "doc-static"))
;;            ("doc-org"
;;             ;; Path to org files.
;;             :base-directory ,(expand-file-name "org" (projectile-project-root))
;;             :base-extension "org"
;;             ;; Path to Jekyll Posts
;;             :publishing-directory ,(projectile-project-root)
;;             :recursive t
;;             :publishing-function org-html-publish-to-html
;;             :headline-levels 4
;;             :html-extension "html"
;;             :body-only t
;;             )
;;            ("doc-static"
;;             :base-directory ,(expand-file-name "org" (projectile-project-root))
;;             :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
;;             :publishing-directory ,(projectile-project-root)
;;             :recursive t
;;             :publishing-function org-publish-attachment)
;;            )
;;          )))))

(setq org-auto-publish nil)
(defun toggle-org-auto-publish ()
  (interactive)
  (setq-local org-auto-publish (if org-auto-publish nil t))
  (message "%s auto publish orgmode document" (if org-auto-publish "Enabled" "Disabled")))
(add-hook 'find-file-hook (lambda()
          (if (org-publish-get-project-from-filename (buffer-file-name))
              (add-hook 'after-save-hook
                        (lambda ()
                          (when org-auto-publish (org-publish-current-project))) t t))))

(require 'ox-html)
(setq org-html-prefer-user-labels t)
(defun org-html-body-remove-id (output)
  "Remove random ID attributes generated by Org."
  (replace-regexp-in-string
     " id=\"[[:alpha:]-]*org[[:alnum:]]\\{7\\}\""
     ""
     output t))
;; TODO(fangzhen) This may break references
(advice-add 'org-html-special-block :filter-return #'org-html-body-remove-id)
(advice-add 'org-html-paragraph :filter-return #'org-html-body-remove-id)
(provide 'init-org)
