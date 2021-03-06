(add-to-list 'load-path (concat user-emacs-directory "config"))
          (add-to-list 'load-path (concat user-emacs-directory "languages"))
          (add-to-list 'load-path (concat user-emacs-directory "lisp"))
          (add-to-list 'load-path (concat user-emacs-directory "lisp/tern"))
          (add-to-list 'load-path (concat user-emacs-directory "lisp/tern/bin"))
          (add-to-list 'load-path (concat user-emacs-directory "lisp/emacs-lsp"))
          (autoload 'tern-mode "tern.el" nil t)
          (add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes"))
          (add-to-list 'load-path "/usr/share/emacs/site-lisp")

          (setq package-archives '(("melpa" . "http://melpa.org/packages/")
                                   ("org" . "http://orgmode.org/elpa/")
                                   ("gnu" . "http://elpa.gnu.org/packages/")
                       ;; ("marmalade" . "http://marmalade-repo.org/packages/")
                                   ))


          (setq package-enable-at-startup nil)
          (unless (package-installed-p 'use-package)
              (package-refresh-contents)
              (package-install 'use-package))

        (setq-default tab-width 4)
      (setq default-tab-width 4)
      (setq-default c-basic-offset 4)

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

          (require 'init-powerline)
          ;(require 'init-spaceline)

          ;; (use-package badwolf-theme 
          ;;     :ensure t
          ;;     :config
          ;;      ;; (load-theme 'arjen-grey t)
          ;;  )
          ;; (use-package monokai-theme :ensure t)
          ;; (use-package molokai-theme :ensure t)
          (use-package gruvbox-theme :ensure t)
          (use-package dracula-theme :ensure t)
          ;; (use-package gotham-theme 
          ;;    :ensure t
          ;;    :config
          ;;     (load-theme 'gotham)
          ;;  )
          (use-package grandshell-theme :ensure t)
          ; (use-package hipster-theme :ensure t)
          (use-package flatland-black-theme :ensure t)
          (use-package firecode-theme :ensure t)
          (use-package django-theme :ensure t)
          ;; (use-package distinguished-theme :ensure t)
          (use-package naquadah-theme :ensure t)

          ;; (require 'init-powerline-ab)


          ;; (require 'init-powerline)
          ;; (require 'init-mode-line)
          (require 'yahoo-weather)
          (yahoo-weather-mode 1)
          (setq yahoo-weather-location "91101")
          (setq yahoo-weather-use-F t)
          (use-package font-lock+
            :ensure t)

          (use-package spaceline
            :after powerline
            :config
            (progn

              (require 'spaceline-all-the-icons)
    (setq spaceline-all-the-icons-separator-type 'none)
              (setq-default mode-line-format '("%e" (:eval (spaceline-ml-ati))))
    ))

            ;; (set-face-foreground 'minibuffer-prompt "white")

            (use-package arjen-grey-theme
                :ensure t
                :config
                ;; (load-theme 'arjen-grey t)
            )

            (use-package gotham-theme 
             :ensure t
             :config
              ;; (load-theme 'gotham)
            )

            (use-package badwolf-theme 
              :ensure t
              :config
               ;; (load-theme 'arjen-grey t)
            )

            (use-package distinguished-theme 
                :ensure t
                :config
                ;;(load-theme 'distinguished)
                )

            (use-package firecode-theme 
                :ensure t
                :config
                ;; (load-theme 'firecode)
                )

    (use-package doom-themes
        :ensure doom-themes
    :config
    (progn
    ;; Global settings (defaults)
    (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
          doom-themes-enable-italic t) ; if nil, italics is universally disabled

    ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
    ;; may have their own settings.
    (load-theme 'doom-vibrant t)

    ;; Enable flashing mode-line on errors
    (doom-themes-visual-bell-config)

    ;; Enable custom neotree theme
    (doom-themes-neotree-config))) ; all-the-icons fonts must be installed!

            (set-face-background 'minibuffer-prompt nil)



          (custom-set-variables
           ;; custom-set-variables was added by Custom.
           ;; If you edit it by hand, you could mess it up, so be careful.
           ;; Your init file should contain only one such instance.
           ;; If there is more than one, they won't work right.
           '(company-ghc-show-info t)
           '(custom-safe-themes
             (quote
              ("810ab30a73c460f5c49ede85d1b9af3429ff2dff652534518fa1de7adc83d0f6" "5b24babd20e58465e070a8d7850ec573fe30aca66c8383a62a5e7a3588db830b" "aae95fc700f9f7ff70efbc294fc7367376aa9456356ae36ec234751040ed9168" "2d16f85f22f1841390dfc1234bd5acfcce202d9bb1512aa8eabd0068051ac8c3" "18a33cdb764e4baf99b23dcd5abdbf1249670d412c6d3a8092ae1a7b211613d5" "9122dfb203945f6e84b0de66d11a97de6c9edf28b3b5db772472e4beccc6b3c5" "b9293d120377ede424a1af1e564ba69aafa85e0e9fd19cf89b4e15f8ee42a8bb" "6bb466c89b7e3eedc1f19f5a0cfa53be9baf6077f4d4a6f9b5d087f0231de9c8" "1bacdd5d24f187f273f488a23c977f26452dffbc82d4ac57250aa041f14159da" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e" "30ba590271e63571536bcded60eca30e0645011a860be1c987fc6476c1603f15" "badc4f9ae3ee82a5ca711f3fd48c3f49ebe20e6303bba1912d4e2d19dd60ec98" default)))
           '(gud-gdb-command-name "gdb --annotate=1")
           '(haskell-tags-on-save t)
           ;; '(helm-ag-base-command "rg")
           '(helm-ag-command-option "")
           ;; '(helm-ag-insert-at-point (quote symbol))
           '(helm-ag-use-agignore t)
           '(large-file-warning-threshold nil)
           '(ns-use-srgb-colorspace nil)
           '(package-selected-packages
             (quote
              (ripgrep spaceline-all-the-icons parinfer kotlin-mode perspective distinguished-theme django-theme firecode-theme flatland-black-theme hipster-theme grandshell-theme gotham-theme dracula-theme quelpa ox-twbs smooth-scrolling smooth-scrolling-mode org-bullets org-bullets-mode swift-mode badwolf-theme monokai-theme slime ycm yalinum use-package sml-mode relative-line-numbers powerline-evil nlinum neotree nav molokai-theme moe-theme linum-relative hlinum helm-projectile helm-flycheck helm-company helm-ag flylisp flycheck-ycmd flycheck-typescript-tslint flycheck-tip flycheck-rust flycheck-package flycheck-ocaml flycheck-irony flycheck-google-cpplint flycheck-gometalinter flycheck-flow flycheck-color-mode-line flycheck-clojure flycheck-clangcheck exec-path-from-shell evil-visualstar evil-terminal-cursor-changer evil-surround evil-space evil-smartparens evil-quickscope evil-paredit evil-org evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-jumper evil-indent-plus evil-god-state evil-exchange evil-escape evil-ediff evil-easymotion evil-commentary evil-cleverparens evil-args elisp-slime-nav company-ycmd company-go cargo))))
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
          ;; (load-theme 'badwolf)
          ;; (load-theme 'dracula)
          ;; (load-theme 'badwolf)
          ;; (load-theme 'dracula)
          ;; (load-theme 'gotham)
          ;; (load-theme 'grandshell)
          ;; (load-theme 'flatland-black)
          ;; (load-theme 'firecode)
          ;; (load-theme 'naquadah)
          ;; (load-theme 'django)
          ;; (load-theme 'distinguished)
          ;; (load-theme 'molokai)
          ;; (powerline-reset)

;; (use-package nlinum-relative
;;     :config
;;     ;; something else you want
;;     (nlinum-relative-setup-evil)
    ;; (add-hook 'prog-mode-hook 'nlinum-relative-mode))

  ;; (use-package relative-line-numbers
  ;;   :ensure relative-line-numbers
  ;;   :init
  ;;   (defun abs-rel-numbers (offset)
  ;;     (if (= offset 0)
  ;;         (format "%4d " (line-number-at-pos))
  ;;       (format "%4d " (abs offset))))
  ;;   :config
  ;;   (progn
  ;;     (global-relative-line-numbers-mode)
  ;;     ))

          (provide 'loader)

          ;;;
          (put 'dired-find-alternate-file 'disabled nil)
