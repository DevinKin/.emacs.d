;;; Lispy
(use-package lispy
  :ensure t
  :defer t
  :hook ((lisp-mode-hook emacs-lisp-mode-hook
			 clojure-mode-hook
			 cider-mode-hook
			 cider-repl-mode-hook
			 lisp-interaction-mode-hook) . lispy-mode))

(provide 'init-lisp)
