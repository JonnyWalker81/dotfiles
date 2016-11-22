;;; Code:
;; Evil mode config

;; In order to work properly, we need to load evil-leader-mode before we load
					;g; evil-mode.
(use-package evil-leader
  :commands (evil-leader-mode global-evil-leader-mode)
  :ensure evil-leader
  :demand evil-leader
  :config
  (progn
    (evil-leader/set-leader ",")
    (global-evil-leader-mode t)

    (evil-leader/set-key
      "k" 'neotree-toggle
      "x" 'helm-M-x)

    (evil-leader/set-key
      "k" 'neotree-toggle
      "x" 'helm-M-x
      "t" 'helm-projectile-find-file
      "d" 'dired
      "gs" 'magit-status
      "gt" 'rtags-find-symbol-at-point
      "e" 'eshell
      "ag" 'helm-projectile-ag
      "at" 'helm-do-ag-this-file
      "o" 'find-file)

    (add-hook 'prog-mode-hook
	      (lambda()
		(evil-leader/set-key
		  "s" 'ff-find-other-file)))
    ))

;; Here's what we've all been waiting for.
;; Recreate Vim inside Emacs.
(use-package evil
  :ensure evil
  :config
  (progn

    (evil-mode 1)
    (setq evil-want-C-u-scroll t)
    (setq evil-want-C-w-in-emacs-state t)
    (setq evil-search-module        'isearch)
    (setq evil-magic                'very-magic)
    ;; (setq evil-emacs-state-cursor   '("#dfaf8f" box))
    ;; (setq evil-normal-state-cursor  '("#f8f893" box))
    ;; (setq evil-insert-state-cursor  '("#f8f893" bar))
    ;; (setq evil-replace-state-cursor '("#cc9393" box))
    (setq evil-want-fine-undo t)
    (setq evil-want-change-word-to-end t)

    (evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
      'elisp-slime-nav-describe-elisp-thing-at-point)
    
    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)


    ;; (add-to-list 'evil-emacs-state-modes 'cider-mode)
    ;; (add-to-list 'evil-insert-state-modes 'eshell-mode)
    (evil-ex-define-cmd "bd[elete]" 'kill-buffer)

    (require 'evil-surround)
    (global-evil-surround-mode 1)
    
    ;; Fix cursor
    (defun my-send-string-to-terminal (string)
      (unless (display-graphic-p) (send-string-to-terminal string)))

    (defun my-evil-terminal-cursor-change ()
      (when (string= (getenv "TERM_PROGRAM") "iTerm.app")
	(add-hook 'evil-insert-state-entry-hook (lambda () (my-send-string-to-terminal "\e]50;CursorShape=1\x7")))
	(add-hook 'evil-insert-state-exit-hook  (lambda () (my-send-string-to-terminal "\e]50;CursorShape=0\x7"))))
      (when (and (getenv "TMUX") (string= (getenv "TERM_PROGRAM") "iTerm.app"))
	(add-hook 'evil-insert-state-entry-hook (lambda () (my-send-string-to-terminal "\ePtmux;\e\e]50;CursorShape=1\x7\e\\")))
	(add-hook 'evil-insert-state-exit-hook  (lambda () (my-send-string-to-terminal "\ePtmux;\e\e]50;CursorShape=0\x7\e\\")))))

    (add-hook 'after-make-frame-functions (lambda (frame) (my-evil-terminal-cursor-change)))
    (my-evil-terminal-cursor-change)

    (use-package evil-commentary
      :ensure evil-commentary
      :config
      (evil-commentary-mode))

    (use-package evil-args
      :ensure evil-args
      :config
      (progn
	;; bind evil-args text objects
	(define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
	(define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

	;; bind evil-forward/backward-args
	(define-key evil-normal-state-map "L" 'evil-forward-arg)
	(define-key evil-normal-state-map "H" 'evil-backward-arg)
	(define-key evil-motion-state-map "L" 'evil-forward-arg)
	(define-key evil-motion-state-map "H" 'evil-backward-arg)

	;; bind evil-jump-out-args
	(define-key evil-normal-state-map "K" 'evil-jump-out-args)
	))

    (use-package evil-org
      :init (add-hook 'org-mode-hook 'evil-org-mode))
    ))

(provide 'init-evil)
;;;

