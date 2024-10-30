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

(require 'init-xterm)

(require 'init-face)
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
