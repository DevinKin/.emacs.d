(use-package yaml-mode
  :ensure t
  :defer t
  :config (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(provide 'init-yaml)
