(use-package lsp-mode
  :ensure t
  :defer t
  :init (setq lsp-keymap-prefix "C-c l")
  :hook ((lsp-mode . lsp-enable-which-key-integration)
	 ((c-mode-hook c++-mode-hook
		       lisp-mode-hook js-mode-hook
		       web-mode-hook
		       python-mode-hook) . lsp))
  :config
  (setq lsp-idle-delay 1200
        lsp-auto-guess-root nil
        lsp-file-watch-threshold 2000
        lsp-eldoc-hook nil
        lsp-log-io nil
        lsp-enable-folding nil
        lsp-enable-snippet nil
        lsp-prefer-flymake :none))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  ;; SideLine
  (setq lsp-ui-sideline-enable t
        lsp-ui-sideline-delay 5)
  ;; Peek
  (setq lsp-ui-peek-enable t)
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  ;; Documents
  (setq lsp-ui-doc-enable t))

(provide 'init-lsp)
