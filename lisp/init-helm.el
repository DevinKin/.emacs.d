(use-package helm 
  :ensure t
  :bind (("M-x" . helm-M-x))
  :config
  (setq helm-display-buffer-default-height 20)
  (setq helm-inherit-input-method nil)
  )

(use-package helm-ag
  :ensure t)

(use-package swiper-helm
  :ensure t
  :bind (("C-s" . swiper)))

(use-package projectile
  :ensure t
  :bind
  (:map
   projectile-mode-map
   ("C-c C-p" . 'projectile-command-map))
  :init
  (projectile-global-mode 1)
  )

(provide 'init-helm)
