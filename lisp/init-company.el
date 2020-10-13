(use-package company
  :ensure t
  :defer t
  :hook (after-init-hook . global-company-mode)
  :bind
  (:map company-mode-map
	:map company-active-map
	("C-n" . 'company-select-next)
	("C-p" . 'company-select-previous)
	("<escape>" . 'company-abort)
	("C-<tab>" . 'company-complete-common-or-cycle))

  :config
  (setq company-idle-delay 0.2
        ;; Some languages use camel case naming convention,
        ;; so company should be case sensitive.
	company-dabbrev-downcase nil
        ;; make previous/next selection in the popup cycles
        company-selection-wrap-around t
        company-show-numbers t
	company-abort-manual-when-too-short t
        company-clang-insert-arguments nil
        company-require-match nil
        company-etags-ignore-case t
        ;; @see https://github.com/company-mode/company-mode/issues/146
        company-tooltip-align-annotations t
	company-global-modes '(not dired-mode dired-sidebar-mode)
	)
  (push 'company-capf company-backends)
  )

(provide 'init-company)
