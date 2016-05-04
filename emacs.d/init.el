;;; Package -- Summary ;;
;;; Commentary:
; Emacs init.el file, I will try to keep this file clean and dlegate to other init files.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:

(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "languages"))
(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes"))
(add-to-list 'load-path "/usr/share/emacs/site-lisp")

(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(require 'use-package)
(require 'init-core)
(require 'init-evil)
(require 'init-languages)
(require 'init-neotree)
(require 'init-helm)
(require 'init-rtags)
(require 'init-company)
(require 'init-flycheck)
(require 'flycheck-rtags)
(require 'init-smartparens)
(require 'init-magit)
(require 'init-gradle)
(require 'gyp)
(require 'init-yasnippet)
(require 'init-org)
;; (require 'init-info+)

;(require 'init-powerline)
;(require 'init-spaceline)

(use-package badwolf-theme :ensure t)
;; (use-package monokai-theme :ensure t)
;; (use-package molokai-theme :ensure t)
(use-package gruvbox-theme :ensure t)

(require 'init-powerline-ab)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e" "30ba590271e63571536bcded60eca30e0645011a860be1c987fc6476c1603f15" "badc4f9ae3ee82a5ca711f3fd48c3f49ebe20e6303bba1912d4e2d19dd60ec98" default)))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(ns-use-srgb-colorspace nil)
 '(package-selected-packages
   (quote
    (swift-mode badwolf-theme monokai-theme slime ycm yalinum use-package sml-mode relative-line-numbers powerline-evil nlinum neotree nav molokai-theme moe-theme linum-relative hlinum helm-projectile helm-flycheck helm-company helm-ag flylisp flycheck-ycmd flycheck-typescript-tslint flycheck-tip flycheck-rust flycheck-package flycheck-ocaml flycheck-irony flycheck-google-cpplint flycheck-gometalinter flycheck-flow flycheck-color-mode-line flycheck-clojure flycheck-clangcheck exec-path-from-shell evil-visualstar evil-terminal-cursor-changer evil-surround evil-space evil-smartparens evil-quickscope evil-paredit evil-org evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-jumper evil-indent-plus evil-god-state evil-exchange evil-escape evil-ediff evil-easymotion evil-commentary evil-cleverparens evil-args elisp-slime-nav company-ycmd company-go cargo))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (use-package color-theme-solarized
;;   :ensure color-theme-solarized
;;   :config
;;   )

;;; sRGB doesn't blend with Powerline's pixmap colors, but is only
;;; used in OS X. Disable sRGB before setting up Powerline.
(when (memq window-system '(mac ns))
  (setq ns-use-srgb-colorspace nil))

(defun random-element (list)
  "Return some element of the list, chosen at random."
  (nth (random (length list)) list))

(setq theme-list '(gruvbox badwolf molokai monokai)) 



;; (load-theme (random-element theme-list)) 
;; (load-theme 'gruvbox)  
;(load-theme 'solarized)
(load-theme 'badwolf)
;; (load-theme 'molokai)
(powerline-reset)

(provide 'init)

;;;
