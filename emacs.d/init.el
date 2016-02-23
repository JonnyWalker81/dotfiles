;;; Package -- Summary ;;
;;; Commentary:
;; Emacs init.el file, I will try to keep this file clean and dlegate to other init files.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

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
    ("b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "36d92f830c21797ce34896a4cf074ce25dbe0dabe77603876d1b42316530c99d" "b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (flycheck flycheck-clangcheck flycheck-clojure flycheck-color-mode-line flycheck-flow flycheck-gometalinter flycheck-google-cpplint flycheck-irony flycheck-ocaml flycheck-package flycheck-rust flycheck-tip flycheck-typescript-tslint flycheck-ycmd flylisp exec-path-from-shell company-go go-mode cargo rust-mode company-ycmd ycm ycmd relative-line-numbers hlinum nlinum yalinum linum-relative helm helm-ag helm-company helm-flycheck sml-mode moe-theme molokai-theme powerline powerline-evil nav neotree evil-args evil-cleverparens evil-commentary evil-easymotion evil-ediff evil-escape evil-exchange evil-god-state evil-indent-plus evil-jumper evil-leader evil-lisp-state evil-magit evil-matchit evil-mc evil-numbers evil-org evil-quickscope evil-smartparens evil-surround evil-terminal-cursor-changer evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq inhibit-startup-screen t)
(setq split-width-threshold most-positive-fixnum)
(setq compilation-read-command nil)

(evil-leader/set-key 
    "k" 'neotree-toggle
    "x" 'helm-M-x)
(add-hook 'c-mode-common-hook
  (lambda() 
    (evil-leader/set-key
      "s" 'ff-find-other-file)))

(require 'company)                                   ; load company mode
(require 'company-go)                                ; load company mode go backend

(global-flycheck-mode)
; (setq flycheck-idle-change-delay 0.2)
; (setq flycheck-check-syntax-automatically '(mode-enabled idle-change save new-line))
(add-hook 'flycheck-mode-hook
	  (lambda()
	    (evil-leader/set-key
		"fc" 'flycheck-buffer)))

(add-hook 'after-init-hook 'global-company-mode)

;(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)
  (go-mode-setup)))

(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

(defun go-mode-setup ()
 ; (setq compile-command "go build -v && go test -v && go vet")
 (setq compile-command (concat "go run " (buffer-file-name)))
 (define-key (current-local-map) "\C-c\C-c" 'compile)
 ; (go-eldoc-setup)
 (setq gofmt-command "goimports")
 (add-hook 'before-save-hook 'gofmt-before-save)
 (local-set-key (kbd "M-.") 'godef-jump))
; (add-hook 'go-mode-hook 'go-mode-setup)

(require 'helm)
(require 'evil)
(require 'evil-leader)
(require 'evil-org)
(evil-leader/set-leader ",")
(global-evil-leader-mode)
(evil-mode 1)

; (require 'yalinum)
; (global-yalinum-mode)

(require 'relative-line-numbers)
(global-relative-line-numbers-mode)

; (require 'nlinum)
; (global-nlinum-mode)
; (require 'linum)
; (global-linum-mode)

; (require 'linum-relative)
; (linum-relative-global-mode)


(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
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
(require 'moe-theme)
(require 'molokai-theme)
(setq moe-theme-mode-line-color 'gray)
; (setq molokai-theme-mode-line-color 'blue)
;; (moe-dark)
(powerline-moe-theme)
(add-hook 'after-init-hook (lambda () (load-theme 'molokai)))
; (powerline-evil-vim-color-theme)
;; smart-mode-line
; (setq sml/theme 'light-powerline)
; (require 'smart-mode-line)
; (sml/setup)
;    (setq sml/mode-width 'full)

;; change mode-line color by evil state
   (lexical-let ((default-color (cons (face-background 'mode-line)
                                      (face-foreground 'mode-line))))
     (add-hook 'post-command-hook
       (lambda ()
         (let ((color (cond ((minibufferp) default-color)
                            ((evil-insert-state-p) '("#e80000" . "#ffffff"))
                            ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
                            ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
                            (t default-color))))
           (set-face-background 'mode-line (car color))
           (set-face-foreground 'mode-line (cdr color))))))

(add-hook 'evil-mode-hook
        (lambda()
            
        (setq evil-emacs-state-cursor '("red" box))
    (setq evil-normal-state-cursor '("green" box))
    (setq evil-visual-state-cursor '("orange" box))
    (setq evil-insert-state-cursor '("red" bar))
    (setq evil-replace-state-cursor '("red" bar))
    (setq evil-operator-state-cursor '("red" hollow))
    ))

