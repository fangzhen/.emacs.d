;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(define-coding-system-alias 'UTF-8 'utf-8)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-package)      ;; Machinery for installing required packages

;; Common configs
(require 'init-misc)
(require 'init-gui-frames)
(require 'init-ibuffer)
(require 'init-ivy)
(require 'init-recentf)
(require 'init-windows)
(require 'init-xterm)
(require 'init-face)

;; Common configs for coding
(require 'init-treemacs)
(require 'init-company)
(require 'init-projectile)
(require 'init-subword)
(require 'init-prog)
;(require 'init-eglot)
(require 'init-lsp-mode)
(require 'init-prog-lang)
;(require 'init-c)
(require 'init-markdown)
(require 'init-org)
(require 'init-yaml)


(require 'init-ai)

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;; I don't load the custom-file here, since 'customize' saves
;; too many configs than I needed.
;; `custom-file-in-action` is a good place for configs that are intended to be
;; out of version control. You need to edit it manually.
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq custom-file-in-action (expand-file-name "custom.in.action.el" user-emacs-directory))
(when (file-exists-p custom-file-in-action)
  (load custom-file-in-action))

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-vc-selected-packages
   '((evedel :url "https://github.com/daedsidog/evedel" :branch "master"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
