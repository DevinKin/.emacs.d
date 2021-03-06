(use-package lsp-mode
  :ensure t
  :commands (lsp-deferred lsp)
  :defer t
  :init (setq lsp-keymap-prefix "C-c l")
  :hook ((lsp-mode-hook . lsp-enable-which-key-integration)
	 ((c-mode-hook c++-mode-hook
		       lisp-mode-hook
		       js-mode-hook
		       web-mode-hook
		       python-mode-hook
		       go-mode-hook) . lsp)
	 ((clojure-mode-hook
	   clojurec-mode-hook
	   clojurescript-mode-hook) . lsp)
	 )
  :config
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))

  (setq lsp-idle-delay 1200
	lsp-auto-guess-root nil
	lsp-file-watch-threshold 2000
	lsp-eldoc-hook nil
	lsp-log-io nil
	lsp-enable-folding nil
	lsp-enable-snippet nil
	lsp-prefer-flymake :none
	lsp-diagnostics-provider :none
	
	lsp-clojure-custom-server-command '("bash" "-c" "clojure-lsp") ;; Optional: In case `clojure-lsp` is not in your PATH
	lsp-enable-indentation nil))

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

(use-package dap-mode
  :ensure t
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode)
  :config
  (setq dap-print-io t) 
  )


(use-package lsp-origami
  :ensure t
  :hook
  ((lsp-after-open-hook . lsp-origami-try-enable)
   (prog-mode-hook . origami-mode))
  )

(provide 'init-lsp)
