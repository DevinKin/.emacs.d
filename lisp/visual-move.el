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
	       (let ((ov (make-overlay (point) (1+ (point)))))
		 (call-interactively cmd)
		 (overlay-put ov 'display (format "%d" i))
		 (overlay-put ov 'face 'position-hint-face)
		 (push ov ovs))))
    (sit-for 1)
    (mapcar #'delete-overlay ovs)
    (setq position-hint-move-function cmd)
    (set-transient-map position-hint-map t (lambda () (setq position-hint-move-function nil)))))

(defun my-forword-word ()
  (interactive)
  (call-interactively #'forward-word)
  (hightlight-position-hint #'forward-word))


(define-key global-map (kbd "<f9>") #'my-forword-word)
