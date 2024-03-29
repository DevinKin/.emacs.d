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
  (setq default-directory "/Users/devin/")
  (setq ns-alternate-modifier 'alt)
  (setq ns-command-modifier 'meta))

;; allow remembering risky variables
(advice-add 'risky-local-variable-p :override #'ignore)

(use-package exec-path-from-shell
  :ensure t
  :config
  (dolist (var '("OPAM_SWITCH_PREFIX" "CAML_LD_LIBRARY_PATH" "OCAML_TOPLEVEL_PATH"))
    (add-to-list 'exec-path-from-shell-variables var))
  (exec-path-from-shell-initialize))


;; Emergency (magit): Magit requires ‘seq’ >= 2.24,
(setq package-install-upgrade-built-in t)

(provide 'init-default)
