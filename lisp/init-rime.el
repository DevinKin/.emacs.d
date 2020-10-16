(use-package rime
  :ensure t
  :custom
  (default-input-method "rime")
  :bind
  (:map rime-mode-map
        ("C-`" . 'rime-send-keybinding))
  )

;; defaults
(setq rime-translate-keybindings
  '("C-f" "C-b" "C-n" "C-p" "C-g"))


(provide 'init-rime)
