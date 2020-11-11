;; (use-package lsp-jedi
;;   :ensure t
;;   :config
;;   ;; (with-eval-after-load "python-mode"
;;   ;;   (add-to-list 'lsp-disabled-clients 'pyls)
;;   ;;   (add-to-list 'lsp-enabled-clients 'jedi))
;;   )

(use-package lsp-python-ms
  :ensure t
  :init (setq
	 lsp-python-ms-executable "/usr/bin/mspyls"
	 lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                         (require 'lsp-python-ms)
                         (lsp))))
					; or lsp-deferred

(provide 'init-python)
