;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ______           _       _   ___         _____                          ;;
;; |  _  \         (_)     | | / (_)       |  ___|                         ;;
;; | | | |_____   ___ _ __ | |/ / _ _ __   | |__ _ __ ___   __ _  ___ ___  ;;
;; | | | / _ \ \ / / | '_ \|    \| | '_ \  |  __| '_ ` _ \ / _` |/ __/ __| ;;
;; | |/ /  __/\ V /| | | | | |\  \ | | | | | |__| | | | | | (_| | (__\__ \ ;;
;; |___/ \___| \_/ |_|_| |_\_| \_/_|_| |_| \____/_| |_| |_|\__,_|\___|___/ ;;
;; Repository: https://github.com/DevinKin/.emacs.d                        ;;
;; Author: DevinKin <https://github.com/DevinKin>                          ;;
;; E-Mail: <deivnkin@163.com>                                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Automatic Optimization
(setq gc-cons-threshold-original gc-cons-threshold)
(setq gc-cons-threshold (* 1024 1024 100))
(setq file-name-handler-alist-original file-name-handler-alist)
(setq inhibit-compacting-font-caches nil)
(setq file-name-handler-alist nil)
(run-with-idle-timer 5 nil (lambda ()
                             (setq gc-cons-threshold gc-cons-threshold-original)
                             (setq file-name-handler-alist file-name-handler-alist-original)
                             (makunbound 'gc-cons-threshold-original)
                             (makunbound 'file-name-handler-alist-original)))


;;; Traverse Load Configuration Folder
(defun add-subdirs-to-load-path(dir)
  "Recursive add directories to `load-path`."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(let ((gc-cons-threshold most-positive-fixnum)
      (file-name-handler-alist nil))
  (add-subdirs-to-load-path "~/.emacs.d/lisp/"))


;;; custom-file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load-file custom-file))

;;; Require Configuration Files
(require 'init-config)

;;; Display Startup Time
(add-hook 'emacs-startup-hook (lambda ()
                                (message "Emacs started in %s with %d garbage collections."
                                         (format "%.2f seconds"
                                                 (float-time
                                                  (time-subtract after-init-time before-init-time)))
                                         gcs-done)))
(put 'set-goal-column 'disabled nil)
