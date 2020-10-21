(use-package org
  :ensure t
  :commands (org-mode)
  :bind
  ("C-<tab>" . org-cycle)
  :config
  (eval-after-load "org"
    '(require 'ox-gfm nil t))

  (setq org-src-fontify-natively t
      org-src-fontify-natively t
      org-src-tab-acts-natively t) ; Highlight code in babel and not ask

  ;; org agenda

  ;; org todo keywords
  (setq org-todo-keywords 
	'((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "REVIEW(r)" "|" "DONE(d)" "CANCELED(c)")))
  (setq org-todo-keyword-faces
	'(("TODO" . org-warning)
	  ("INPROGRESS" . "yellow")
	  ("WAITING" . "purple")
	  ("REVIEW" . "orange")
	  ("DONE" . "green")
	  ("CANCELED" .  "red")))

  ;; close todo with note
  (setq org-log-done 'note)
  (setq org-startup-truncated t)

  (add-hook 'org-mode-hook 'turn-on-auto-fill)

  ;; org-mode标题设置大小，高亮，加粗。
  (set-face-attribute 'org-level-1 nil :height 1.6 :bold t)
  (set-face-attribute 'org-level-2 nil :height 1.4 :bold t)
  (set-face-attribute 'org-level-3 nil :height 1.2 :bold t)
  (set-face-attribute 'org-level-4 nil :height 1.0 :bold t)

  ;; 设置org-moded代码块支持的语言
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((latex . t)
     (lisp . t)
     (emacs-lisp . t)
     (clojure . t)
     (shell . t)))

  (setq org-hide-leading-stars t) ; Hide the leading stars
  )

(use-package ox-gfm
  :ensure t)


;;; Org Bullets
(use-package org-bullets
  :ensure t
  :hook (org-mode-hook . (lambda () (org-bullets-mode t)))
  :custom (org-bullets-bullet-list '("☰" "☷" "✿" "☭")))


;;; Org hugo blog
(use-package ox-hugo
  :ensure t
  :after ox)

(provide 'init-org)
