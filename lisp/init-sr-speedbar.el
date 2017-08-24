(require-package 'sr-speedbar)

(setq sr-speedbar-auto-refresh nil)
(setq sr-speedbar-width 25)
(setq sr-speedbar-right-side nil)
(setq speedbar-use-images nil)
(setq speedbar-show-unknown-files t)

(defun speedbar-create-file ()
  "Create an empty in speedbar."
  (interactive)
  (let ((f (speedbar-line-file)))
    (if f
	(let* ((basedir (if (file-directory-p f) f (file-name-directory f)))
	       (newfile (read-directory-name "Create File: "
                                             basedir)))
	  ;; Create the file
          (make-directory (file-name-directory newfile) t)
          (write-region "" nil newfile)
	  (speedbar-refresh)
	  (speedbar-goto-this-file newfile)
	  )
      (error "Not a file"))))

(sr-speedbar-open)
(define-key speedbar-file-key-map "\C-m" 'speedbar-toggle-line-expansion)
(define-key speedbar-file-key-map "F" 'speedbar-create-file)

(provide 'init-sr-speedbar)

