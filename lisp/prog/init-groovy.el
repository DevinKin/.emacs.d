(use-package groovy-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode)))

(use-package gradle-mode
  :ensure t
  :hook (groovy-mode-hook . gradle-mode))
(provide 'init-groovy)
