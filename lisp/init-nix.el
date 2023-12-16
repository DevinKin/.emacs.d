(use-package nix-mode
  :ensure t
  :mode "\\.nix\\'")

(use-package nixos-options
  :ensure t )

(use-package helm-nixos-options
  :ensure t
  :after nix-mode
  :bind
  (:map
   nix-mode-map
   ("C-c C-o" . 'helm-nixos-options))
  )

(use-package company-nixos-options
  :ensure t
  :config
  (add-to-list 'company-backends 'company-nixos-options))

(provide 'init-nix)
