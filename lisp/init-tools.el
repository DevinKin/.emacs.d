;;; Hungry Delete
(use-package hungry-delete
  :ensure t
  :defer 1
  :bind (("C-' C-h" . hungry-delete-mode)
         ("C-' DEL" . hungry-delete-backward))
  :hook ((emacs-lisp-mode-hook lisp-mode-hook) . hungry-delete-mode))


;;; Diff Highlight
(use-package diff-hl
  :ensure t
  :defer 1
  :hook (prog-mode-hook . diff-hl-mode))

;;; Magit
(use-package magit
  :ensure t
  :bind (("C-' m" . magit-status)))

;;; youdao-dictionary
(use-package youdao-dictionary
  :ensure t
  :bind (("C-c y" . youdao-dictionary-search-at-point+))
  :config
  (setq url-automatic-cachin t))


(use-package popwin
  :ensure t
  :hook (after-init-hook . popwin-mode))


;;; Company English Helper
(use-package company-english-helper
  :load-path "~/.emacs.d/site-lisp/company-english-helper"
  :config
  (load-file "~/.emacs.d/site-lisp/company-english-helper/company-english-helper-data.el")
  :bind (("C-' C-l s" . company-english-helper-search)))


;;; Iedit
(use-package iedit
  :ensure t
  :defer 1
  :bind (("C-' C-e" . iedit-mode)))

;;; Multiple Cursor
(use-package multiple-cursors
  :ensure t
  :defer 1
  :bind (("C-M-l" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("M-m" . newline)))



;;; Emacs application framework
(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework" 
  :defer 1
  :config
  (require 'eaf-evil)
  (eaf-setq eaf-browser-remember-history "true")
  (eaf-setq eaf-browser-default-zoom "1.0")
  )

(provide 'init-tools)
