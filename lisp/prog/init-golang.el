(use-package go-mode
  :ensure t
  :bind (
         ;; If you want to switch existing go-mode bindings to use lsp-mode/gopls instead
         ;; uncomment the following lines
         ;; ("C-c C-j" . lsp-find-definition)
         ;; ("C-c C-d" . lsp-describe-thing-at-point)
         )
  :hook ((go-mode . lsp-deferred)
         (before-save-hook . lsp-format-buffer)
         (before-save-hook . lsp-organize-imports)
	 (go-mode-hook . (lambda ()
			   (require 'dap-go)
			   (dap-go-setup))))
  :config
  ;; (add-to-list 'lsp-enabled-clients 'gopls)
  (add-hook 'go-mode-hook
	    (lambda ()
	      (setq tab-width 4)))
  :bind
  (:map go-mode-map
	("C-c C-r" . devinkin/golang-run)))


(defvar devinkin-default-golang-run-command "go run main.go")

(defun devinkin/golang-run ()
  (interactive)
  (compile (format "%s" devinkin-default-golang-run-command))
  (pop-to-buffer "*compilation*"))

(provide 'init-golang)
