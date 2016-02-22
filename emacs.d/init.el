;; Emacs init.el file, I will try to keep this file clean and dlegate to other init files.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("36d92f830c21797ce34896a4cf074ce25dbe0dabe77603876d1b42316530c99d" "b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (company-ycmd ycm ycmd relative-line-numbers hlinum nlinum yalinum linum-relative helm helm-ag helm-company helm-flycheck sml-mode moe-theme molokai-theme powerline powerline-evil nav neotree evil-args evil-cleverparens evil-commentary evil-easymotion evil-ediff evil-escape evil-exchange evil-god-state evil-indent-plus evil-jumper evil-leader evil-lisp-state evil-magit evil-matchit evil-mc evil-numbers evil-org evil-quickscope evil-smartparens evil-surround evil-terminal-cursor-changer evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'after-init-hook 'global-company-mode)

(require 'helm)
(require 'evil)
(require 'evil-leader)
(require 'evil-org)
(evil-leader/set-leader ",")
(global-evil-leader-mode)
(evil-mode 1)

(require 'yalinum)
(global-yalinum-mode)

; (require 'relative-line-numbers)
; (global-relative-line-numbers-mode)

; (require 'nlinum)
; (global-nlinum-mode)
; (require 'linum)
; (global-linum-mode)

; (require 'linum-relative)
; (linum-relative-global-mode)


(require 'neotree)

(add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

(setq neo-smart-open t)

(evil-leader/set-key 
    "k" 'neotree-toggle
    "x" 'helm-M-x)

(require 'powerline)
(require 'powerline-evil)
; (require 'moe-theme)
; (setq moe-theme-mode-line-color 'blue)
;; (moe-dark)
;; (powerline-moe-theme)
; (powerline-evil-vim-color-theme)
;; smart-mode-line
(setq sml/theme 'light-powerline)
(require 'smart-mode-line)
(sml/setup)
    (setq sml/mode-width 'full)
(add-hook 'evil-mode-hook
        (lambda()
            
        (setq evil-emacs-state-cursor '("red" box))
    (setq evil-normal-state-cursor '("green" box))
    (setq evil-visual-state-cursor '("orange" box))
    (setq evil-insert-state-cursor '("red" bar))
    (setq evil-replace-state-cursor '("red" bar))
    (setq evil-operator-state-cursor '("red" hollow))
    ))

