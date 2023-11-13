(use-package rust-mode
  :ensure t
  :hook ((rust-mode . my/rust-lsp))
  :config
  (setq rust-format-on-save t)
  (defun my/rust-lsp ()
    (setq-local lsp-completion-enable nil
		compile-command "cargo build"))
  (setq lsp-log-io nil
        lsp-eldoc-render-all nil
        lsp-completion-provider t
        ;; lsp-completion-enable nil
        lsp-signature-render-documentation nil
        lsp-rust-server 'rust-analyzer
        lsp-rust-analyzer-cargo-watch-enable nil
        lsp-gopls-hover-kind "NoDocumentation"
        lsp-gopls-use-placeholders t
        lsp-diagnostics-provider :none))

(provide 'init-rust)
