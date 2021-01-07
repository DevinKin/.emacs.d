;;; some default settings

;; simplify yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; disable mouse operate dialog
(setq use-dialog-box nil)
;; disable backup-files
(setq make-backup-files nil)
;; close open buffer auto-saving
(setq auto-save-default nil)
;; stratch-message
(setq initial-scratch-message
      ";; DevinKin's Emacs
;; This is the scratch buffer for startup page and test Emacs Lisp code

")
; Highlight the ()
(show-paren-mode t) 

(setq tab-width 4)

(when (eq system-type 'darwin)
    (setq default-directory "/Users/devkin/")
    ;; (add-to-list 'exec-path "/usr/local/bin")
    )
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(provide 'init-default)
