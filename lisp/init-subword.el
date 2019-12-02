;; Another solution using subword
;; https://www.reddit.com/r/emacs/comments/2qdp7s/heres_a_way_to_change_a_wordbyword_movement/
(require-package 'subword)
(require-package 'syntax-subword)
; https://stackoverflow.com/questions/24745338/make-emacs-forward-word-stop-at-more-points
(global-syntax-subword-mode 1)
(provide 'init-subword)
