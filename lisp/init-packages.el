;;;; This file is used for packages configuration and more

;;; Init Packages
(package-initialize)

;;; Mirror
(require 'package)
;;; fix Package cl is deprecated
(require 'cl-lib) ; Common Lisp

(setq package-archives '(("gnu" . "http://mirrors.bfsu.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.bfsu.edu.cn/elpa/melpa/")))

;;; Init Use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-hook-name-suffix nil)


(provide 'init-packages)
