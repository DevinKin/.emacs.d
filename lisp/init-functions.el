;;; some custom functions

;; F2打开配置文件
(defun open-init-file()
  "Open init file with key <f2>"
  (interactive)
  (find-file (expand-file-name "init.el" user-emacs-directory)))

;; 缩进buffer
(defun indent-buffer()
  "Indent current-buffer"
  (interactive)
  (indent-region (point-min) (point-max)))

;; 缩进buffer或者region
(defun indent-region-or-buffer()
  "Indent current buffer or region"
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

;; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(provide 'init-functions)
