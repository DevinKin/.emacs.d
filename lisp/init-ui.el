;; Close tool bar
(tool-bar-mode -1)
;; Close scroll bar
(scroll-bar-mode -1)
;; disable splash screen 
(setq inhibit-splash-screen 1)
;; hide mode-line
(setq mode-line-format nil)
(setq-default mode-line-format nil)
;; highlight current line
(global-hl-line-mode 1)
;; hide menu-bar
(menu-bar-mode 0)
;; disable cursor blink
(blink-cursor-mode 0)
;; emacs alpha 90
;; (set-frame-parameter (selected-frame) 'alpha 90)

;; font configuration
(setq devinkin/font-name "Source Code Pro"
      devinkin/font-style "Regular"
      devinkin/font-size 18)
(if (fontp (font-spec
            :name devinkin/font-name
            :style devinkin/font-style
            :size devinkin/font-size))
    (progn
      (set-face-attribute 'default nil
                          :font (font-spec
                                 :name devinkin/font-name
                                 :style devinkin/font-style
                                 :size devinkin/font-size))
      (set-fontset-font t ?中 (font-spec
                               :name devinkin/font-name
                               :style devinkin/font-style
                               :size devinkin/font-size)))
  (message "Can't find %s font. You can install it or ignore this message at init-ui.el" devinkin/font-name))

;; support emoji front
(set-fontset-font
 t
 '(#x1f300 . #x1fad0)
 (cond
  ((member "Noto Color Emoji" (font-family-list)) "Noto Color Emoji")
  ((member "Noto Emoji" (font-family-list)) "Noto Emoji")
  ((member "Segoe UI Emoji" (font-family-list)) "Segoe UI Emoji")
  ((member "Symbola" (font-family-list)) "Symbola")
  ((member "Apple Color Emoji" (font-family-list)) "Apple Color Emoji"))
 ;; Apple Color Emoji should be before Symbola, but Richard Stallman disabled it.
 ;; GNU Emacs Removes Color Emoji Support on the Mac
 ;; http://ergoemacs.org/misc/emacs_macos_emoji.html
 ;;
 )

;;; theme configuration: doom theme
(use-package all-the-icons
  :ensure t)

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;;; Rainbow Delimiters
(use-package rainbow-delimiters
  :ensure t
  :defer 1
  :hook ((prog-mode-hook org-mode-hook eshell-mode-hook) . rainbow-delimiters-mode)
  :config
  (set-face-attribute 'rainbow-delimiters-depth-1-face nil :foreground "chartreuse3"   :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-2-face nil :foreground "DodgerBlue1"   :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-3-face nil :foreground "DarkOrange2"   :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-4-face nil :foreground "deep pink"     :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-5-face nil :foreground "medium orchid" :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-6-face nil :foreground "turquoise"     :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-7-face nil :foreground "lime green"    :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-8-face nil :foreground "gold"          :bold "t")
  (set-face-attribute 'rainbow-delimiters-depth-9-face nil :foreground "cyan"          :bold "t"))


;;; Indent Guide
(use-package indent-guide
  :ensure t
  :defer 1
  :hook (after-init-hook . indent-guide-global-mode))

;;; Info Colors
(use-package info-colors
  :ensure t
  :defer 1
  :hook ('Info-selection-hook . 'info-colors-fontify-node))

;;; Page Break Lines
(use-package page-break-lines
  :ensure t
  :defer 1
  :hook (prog-mode-hook . page-break-lines-mode))

(custom-set-faces '(hl-line ((t
			      :extend t
			      :underline "#65EAB9")))
		  '(magit-section-highlight ((t
			      :underline nil)))
		  )

(provide 'init-ui)
