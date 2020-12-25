(use-package json-mode
  :ensure t
  )

(use-package json-snatcher
  :ensure t
  :defer t
  :after json-mode)

(provide 'init-json)
