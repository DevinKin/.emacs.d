;; -*- lexical-binding: t; -*-
;; wow wow wow wow wow wow

(require 'cl-lib)

(defface position-hint-face
  '((t
     (:inherit region)))
  "Position hint")


(defvar position-hint-move-function nil)

(defun move-to-position-hint (n)
  (dotimes (_i n)
    (call-interactively position-hint-move-function))
  (hightlight-position-hint position-hint-move-function))

(defun move-to-position-hint-2 ()
  (interactive)
  (move-to-position-hint 2))

(defun move-to-position-hint-1 ()
  (interactive)
  (move-to-position-hint 1))

(defvar position-hint-map
  (let ((keymap (make-sparse-keymap)))
    (define-key keymap (kbd "M-1") 'move-to-position-hint-1)
    (define-key keymap (kbd "M-2") 'move-to-position-hint-2)
    keymap))

(defun hightlight-position-hint (cmd)
  (let (ovs)
    (save-mark-and-excursion
      (cl-loop for i from 1 to 9 do
	       (call-interactively cmd)
	       (let ((ov (make-overlay (point) (1+ (point)))))
		 (overlay-put ov 'display
			      (cond ((looking-at-p "\n")
				     (format "%d\n" i))
				    (t (format "%d" i))))
		 (overlay-put ov 'face 'position-hint-face)
		 (push ov ovs))))
    (sit-for 1)
    (mapcar #'delete-overlay ovs)
    (setq position-hint-move-function cmd)
    (set-transient-map position-hint-map t (lambda () (setq position-hint-move-function nil)))))

(defun my-forward-word ()
  (interactive)
  (call-interactively #'forward-word)
  (hightlight-position-hint #'forward-word))

(defun my-backward-word ()
  (interactive)
  (call-interactively #'backward-word)
  (hightlight-position-hint #'backward-word))


;; (define-key global-map (kbd "<f9>") #'my-forward-word)
(define-key global-map [remap forward-word] #'my-forward-word)
(define-key global-map [remap backward-word] #'my-backward-word)

(provide 'visual-move)
