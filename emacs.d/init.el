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
                         ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))

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
(require 'init-hackernews)
;; (require 'init-info+)

;(require 'init-powerline)
;(require 'init-spaceline)

(use-package badwolf-theme :ensure t)
;; (use-package monokai-theme :ensure t)
;; (use-package molokai-theme :ensure t)
(use-package gruvbox-theme :ensure t)
(use-package dracula-theme :ensure t)
(use-package gotham-theme :ensure t)
(use-package grandshell-theme :ensure t)
(use-package hipster-theme :ensure t)
(use-package flatland-black-theme :ensure t)
(use-package firecode-theme :ensure t)
(use-package django-theme :ensure t)
(use-package distinguished-theme :ensure t)

(require 'init-powerline-ab)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(custom-safe-themes
   (quote
<<<<<<< HEAD
    ("bb86e64bbb372d158745c50b31254d96f7fb0cbb1bda1b3eb7a6d3d34713cf7b" "427fed191e7a766152e59ef0e2904283f436dbbe259b9ccc04989f3acde50a55" "d1abda58eedee72fbe28bbb7a5ff1953e1b7d2fa80913bcea9cb3cf12cf751f4" "1bacdd5d24f187f273f488a23c977f26452dffbc82d4ac57250aa041f14159da" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e" "30ba590271e63571536bcded60eca30e0645011a860be1c987fc6476c1603f15" "badc4f9ae3ee82a5ca711f3fd48c3f49ebe20e6303bba1912d4e2d19dd60ec98" default)))
=======
    ("aae95fc700f9f7ff70efbc294fc7367376aa9456356ae36ec234751040ed9168" "2d16f85f22f1841390dfc1234bd5acfcce202d9bb1512aa8eabd0068051ac8c3" "18a33cdb764e4baf99b23dcd5abdbf1249670d412c6d3a8092ae1a7b211613d5" "9122dfb203945f6e84b0de66d11a97de6c9edf28b3b5db772472e4beccc6b3c5" "b9293d120377ede424a1af1e564ba69aafa85e0e9fd19cf89b4e15f8ee42a8bb" "6bb466c89b7e3eedc1f19f5a0cfa53be9baf6077f4d4a6f9b5d087f0231de9c8" "1bacdd5d24f187f273f488a23c977f26452dffbc82d4ac57250aa041f14159da" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e" "30ba590271e63571536bcded60eca30e0645011a860be1c987fc6476c1603f15" "badc4f9ae3ee82a5ca711f3fd48c3f49ebe20e6303bba1912d4e2d19dd60ec98" default)))
>>>>>>> 241e17e3a7e840d2f4cf9b0188b10ac271647496
 '(gud-gdb-command-name "gdb --annotate=1")
 '(haskell-tags-on-save t)
 '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
 '(helm-ag-command-option "--all-text")
 '(helm-ag-insert-at-point (quote symbol))
 '(large-file-warning-threshold nil)
 '(ns-use-srgb-colorspace nil)
 '(package-selected-packages
   (quote
<<<<<<< HEAD
    (restclient ox-reveal org-reveal dracula-theme quelpa ox-twbs smooth-scrolling smooth-scrolling-mode org-bullets org-bullets-mode swift-mode badwolf-theme monokai-theme slime ycm yalinum use-package sml-mode relative-line-numbers powerline-evil nlinum neotree nav molokai-theme moe-theme linum-relative hlinum helm-projectile helm-flycheck helm-company helm-ag flylisp flycheck-ycmd flycheck-typescript-tslint flycheck-tip flycheck-rust flycheck-package flycheck-ocaml flycheck-irony flycheck-google-cpplint flycheck-gometalinter flycheck-flow flycheck-color-mode-line flycheck-clojure flycheck-clangcheck exec-path-from-shell evil-visualstar evil-terminal-cursor-changer evil-surround evil-space evil-smartparens evil-quickscope evil-paredit evil-org evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-jumper evil-indent-plus evil-god-state evil-exchange evil-escape evil-ediff evil-easymotion evil-commentary evil-cleverparens evil-args elisp-slime-nav company-ycmd company-go cargo))))
=======
    (distinguished-theme django-theme firecode-theme flatland-black-theme hipster-theme grandshell-theme gotham-theme dracula-theme quelpa ox-twbs smooth-scrolling smooth-scrolling-mode org-bullets org-bullets-mode swift-mode badwolf-theme monokai-theme slime ycm yalinum use-package sml-mode relative-line-numbers powerline-evil nlinum neotree nav molokai-theme moe-theme linum-relative hlinum helm-projectile helm-flycheck helm-company helm-ag flylisp flycheck-ycmd flycheck-typescript-tslint flycheck-tip flycheck-rust flycheck-package flycheck-ocaml flycheck-irony flycheck-google-cpplint flycheck-gometalinter flycheck-flow flycheck-color-mode-line flycheck-clojure flycheck-clangcheck exec-path-from-shell evil-visualstar evil-terminal-cursor-changer evil-surround evil-space evil-smartparens evil-quickscope evil-paredit evil-org evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-jumper evil-indent-plus evil-god-state evil-exchange evil-escape evil-ediff evil-easymotion evil-commentary evil-cleverparens evil-args elisp-slime-nav company-ycmd company-go cargo))))
>>>>>>> 241e17e3a7e840d2f4cf9b0188b10ac271647496
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
;; (load-theme 'dracula)
;; (load-theme 'badwolf)
;; (load-theme 'dracula)
;; (load-theme 'gotham)
;; (load-theme 'grandshell)
;; (load-theme 'flatland-black)
;; (load-theme 'firecode)
;; (load-theme 'django)
(load-theme 'distinguished)
;; (load-theme 'molokai)
(powerline-reset)

(provide 'init)

;;;
