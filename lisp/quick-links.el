;; -*- lexical-binding: t; -*-

(defun create-quick-config-link (label link)
  (insert label ": ")
  (message link)
  (insert-button link 'action (lambda (_) (find-file link))
		 'follow-link t)
  (insert "\n"))


(defun open-quick-config-links ()
  (interactive)
  (let ((buf (get-buffer-create "*Config Links*"))
	(configs '(("GOLANG" . "~/testgo/test.go")
		   ("Emacs" . "~/.emacs.d")
		   ("Xprofile" . "~/.xprofile"))))
    (with-current-buffer buf
      (erase-buffer)
      (mapcar (lambda (item)
		(create-quick-config-link (car item) (cdr item)))
	      configs)
      (create-quick-config-link "GOLANG" "~/testgo/test.go"))
    (pop-to-buffer buf t)))


(define-key global-map (kbd "<f6>") #'open-quick-config-links)
