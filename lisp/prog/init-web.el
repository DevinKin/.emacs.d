(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package emmet-mode
  :ensure t
  :hook
  (web-mode-hook . emmet-mode)
  (html-mode-hook . emmet-mode)
  (css-mode-hook . emmet-mode)

  :bind ((:map emmet-mode-keymap
	       ("M-e" . 'emmet-expand-line))))

(provide 'init-web)
