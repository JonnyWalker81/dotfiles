;;; Package -- Summary ;;
;;; Commentary:
;; Emacs init.el file, I will try to keep this file clean and dlegate to other init files.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:

(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "languages"))
(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes"))
(add-to-list 'load-path "/usr/share/emacs/site-lisp")

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
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
(require 'init-company)
(require 'init-flycheck)
(require 'init-smartparens)
(require 'init-magit)

;(require 'init-powerline)
(require 'init-powerline-ab)
;(require 'init-spaceline)

(use-package gruvbox-theme :ensure t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("badc4f9ae3ee82a5ca711f3fd48c3f49ebe20e6303bba1912d4e2d19dd60ec98" default)))
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(ns-use-srgb-colorspace nil)
 '(package-selected-packages
   (quote
    (slime ycm yalinum use-package sml-mode relative-line-numbers powerline-evil nlinum neotree nav molokai-theme moe-theme linum-relative hlinum helm-projectile helm-flycheck helm-company helm-ag flylisp flycheck-ycmd flycheck-typescript-tslint flycheck-tip flycheck-rust flycheck-package flycheck-ocaml flycheck-irony flycheck-google-cpplint flycheck-gometalinter flycheck-flow flycheck-color-mode-line flycheck-clojure flycheck-clangcheck exec-path-from-shell evil-visualstar evil-terminal-cursor-changer evil-surround evil-space evil-smartparens evil-quickscope evil-paredit evil-org evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-jumper evil-indent-plus evil-god-state evil-exchange evil-escape evil-ediff evil-easymotion evil-commentary evil-cleverparens evil-args elisp-slime-nav company-ycmd company-go cargo))))
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

(load-theme 'gruvbox)
;(load-theme 'solarized)

(provide 'init)

;;;
