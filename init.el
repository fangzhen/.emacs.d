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
(require 'init-eglot)
(require 'init-prog-lang)
;(require 'init-c)
(require 'init-markdown)
(require 'init-yaml)

(require 'init-term)

(require 'init-face)
;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
