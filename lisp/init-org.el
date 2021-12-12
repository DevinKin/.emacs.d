(use-package org
  :ensure t
  :commands (org-mode)
  :bind
  (("C-<tab>" . org-cycle)
   ("C-M-<return>" . org-meta-return))
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

(use-package org-roam
  :ensure t
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "/home/devinkin/org-roam/")
  :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))

;; (use-package org-roam-server
;;   :ensure t
;;   :config
;;   (setq org-roam-server-host "127.0.0.1"
;;         org-roam-server-port 9999
;;         org-roam-server-authenticate nil
;;         org-roam-server-export-inline-images t
;;         org-roam-server-serve-files nil
;;         org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
;;         org-roam-server-network-poll t
;;         org-roam-server-network-arrows nil
;;         org-roam-server-network-label-truncate t
;;         org-roam-server-network-label-truncate-length 60
;;         org-roam-server-network-label-wrap-length 20))

(provide 'init-org)
