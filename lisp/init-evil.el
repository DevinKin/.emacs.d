
(use-package evil
  :ensure t
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
    "llh" 'slime-hyperspec-lookup
    "sa" 'mark-whole-buffer
    "fj" 'dired-jump
    "ps" 'helm-do-ag-project-root
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
(use-package evil-magit
  :ensure t
  :after evil magit
  :init
  (setq evil-magit-state 'normal)
  (setq evil-magit-use-y-for-yank t)
  ;:config
  ;(evil-magit-revert)
  )

(provide 'init-evil)
