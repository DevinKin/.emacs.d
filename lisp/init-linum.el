(use-package linum-relative
  :ensure t
  :config
  (setq linum-relative-backend 'display-line-numbers-mode)
  (global-display-line-numbers-mode 1)
  (linum-relative-on))

(provide 'init-linum)
