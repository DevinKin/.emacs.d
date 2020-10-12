(use-package which-key
  :ensure t
  :defer t
  :hook (after-init-hook . which-key-mode)
  :config (setq which-key-idle-delay 0.65)
  )


;; org-agenda short cut
(global-set-key (kbd "C-c a") 'org-agenda)
;; indent buffer or region
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)
;; open init-file
(global-set-key (kbd "<f2>") 'open-init-file)
;; helm-buffer-list
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(provide 'init-keybindings)
