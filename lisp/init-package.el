(require 'package)

;;; Also use Melpa for most packages
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(setq package-check-signature 'allow-unsigned)

;; Bug https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;; Bug https://debbugs.gnu.org/cgi/bugreport.cgi?bug=33825
(setq  package-check-signature nil)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(provide 'init-package)
