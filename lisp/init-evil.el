
(use-package evil
  :ensure t
  :init (setq evil-want-keybinding nil)
  :config (evil-mode 1))

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "ff" 'helm-find-files
    "fr" 'helm-recentf
    "bb" 'helm-buffers-list
    "0"  'select-window-0
    "1"  'select-window-1
    "2"  'select-window-2
    "3"  'select-window-3
    "wr" 'split-window-right
    "wb" 'split-window-below
    "wM" 'delete-other-windows
    "ud" 'undo-tree-visualize
    "oa" 'org-agenda
    "mgs" 'magit-status
    "mgb" 'magit-blame
    "llh" 'slime-hyperspec-lookup
    "sa" 'mark-whole-buffer
    "fj" 'dired-jump
    "ps" 'helm-do-ag-project-root
    "eoo" 'eaf-open
    "eob" 'eaf-open-browser
    "eot" 'eaf-open-terminal
    "ol" 'helm-imenu

    ;; code folding using origami 
    "ho" 'origami-open-node
    "hao" 'origami-open-all-nodes
    "hro" 'origami-open-node-recursively
    "hs" 'origami-show-node
    "hns" 'origami-show-only-node
    "hc" 'origami-close-node
    "hac" 'origami-close-all-nodes
    "hrc" 'origami-close-node-recursively
    "hnt" 'origami-toggle-node
    "hat" 'origami-toggle-all-nodes
    "hrt" 'origami-recursively-toggle-node
    "hff" 'origami-forward-fold
    "hfp" 'origami-previous-fold
    "hfn" 'origami-next-fold
    "hft" 'origami-forward-toggle-node
    "hfs" 'origami-forward-fold-same-level
    "hbs" 'origami-backward-fold-same-level
    "hu" 'origami-undo
    "hrd" 'origami-redo
    "hrs" 'origami-reset
    ))

(use-package evil-surround
  :ensure t
  :config (global-evil-surround-mode))


(use-package evil-nerd-commenter
  :ensure t
  :config
  (evil-leader/set-key
    "ci" 'evilnc-comment-or-uncomment-lines
    "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
    "cc" 'evilnc-copy-and-comment-lines
    "cp" 'evilnc-comment-or-uncomment-paragraphs
    "cr" 'comment-or-uncomment-region
    "cv" 'evilnc-toggle-invert-comment-line-by-line
    "."  'evilnc-copy-and-comment-operator
    "\\" 'evilnc-comment-operator ; if you prefer backslash key
    ))

;;; Evil magit
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))
  ;; See https://github.com/emacs-evil/evil-collection/issues/60 for more details.)

(provide 'init-evil)
