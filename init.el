;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
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
(require 'init-hippie-expand)

;; Common configs for coding
(require 'init-treemacs)
(require 'init-company)
(require 'init-projectile)
(require 'init-subword)
(require 'init-prog)

;; Configs for specific languages
(require 'init-c)
(require 'init-python)
(require 'init-markdown)
(require 'init-yaml)

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

(require 'init-sessions)

(provide 'init)
