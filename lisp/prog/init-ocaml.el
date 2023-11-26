(use-package tuareg
  :ensure t
  :hook (tuareg-mode-hook . (lambda ()
			      (let ((fn (buffer-file-name)))
				(if (and fn (locate-dominating-file fn ".merlin"))
				    (merlin-mode)))))
  ;:init
  ;; (add-hook 'tuareg-mode-hook #'my-tuareg-mode-setup)

  :config
  (setq tuareg-indent-align-with-first-arg t)
  (setq indicate-empty-lines t)
  (add-hook 'tuareg-mode-hook 'prettify-symbols-mode)
  (add-hook 'tuareg-mode-hook 'flyspell-prog-mode)
  (add-hook 'tuareg-mode-hook 'utop-minor-mode)


  :bind
  (:map
   tuareg-mode-map
   ([(f12)] . 'next-error)
   ([(shift f12)] . 'previous-error)
   ;; ("C-M-<tab>" . 'ocamlformat)
   ("C-c C-h" . 'merlin-document)))

(use-package ocamlformat
  :ensure t
  :custom (ocamlformat-enable 'etuareg-mode-mapnable-outside-detected-project)
  :hook (before-save . ocamlformat-before-save)
  )

(use-package merlin
  :ensure t
  :after tuareg

  :config
  (add-hook 'tuareg-mode-hook #'merlin-mode))

(use-package utop
  :ensure t)

(provide 'init-ocaml)
