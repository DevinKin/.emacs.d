;; usage: http://elpa.gnu.org/packages/csv-mode.html
(use-package csv-mode
  :ensure t
  :defer t
  :config (add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
  :hook (csv-mode-hook . csv-align-mode))

(provide 'init-csv)
