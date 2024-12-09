;;; init-subword.el --- Configuration for subword mode

;;; Commentary:
;;; Code:

;; Another solution using subword
;; https://www.reddit.com/r/emacs/comments/2qdp7s/heres_a_way_to_change_a_wordbyword_movement/
(use-package subword)
(use-package syntax-subword
  :config
  ; https://stackoverflow.com/questions/24745338/make-emacs-forward-word-stop-at-more-points
  (global-syntax-subword-mode 1)
)

(provide 'init-subword)
;;; init-subword.el ends here
