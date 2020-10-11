(use-package helm 
  :ensure t
  :bind (("M-x" . helm-M-x))
  :config
  (setq helm-display-buffer-default-height 20)
  )

(use-package helm-ag
  :ensure t)

(use-package swiper-helm
  :ensure t
  :bind (("C-s" . swiper)))

(provide 'init-helm)
