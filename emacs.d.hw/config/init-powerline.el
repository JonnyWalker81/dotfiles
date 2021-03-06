;;; Code:

(use-package powerline
  :ensure powerline
  :config
  (progn
    (use-package powerline-evil
      :ensure powerline-evil)

    	    (setq powerline-default-separator 'arrow)
    (use-package moe-theme
      :ensure moe-theme
      :config
      (progn
	;; (setq moe-theme-mode-line-color 'w/b)
	;; bad hack :( ... see https://github.com/milkypostman/powerline/issues/54

	(custom-set-variables '(ns-use-srgb-colorspace nil))
	(moe-dark)))
    ;; 		      (powerline-moe-theme)))

    ;; (use-package spaceline
    ;;   :ensure spaceline
    ;;   :config
    ;;   (progn
    ;; 	(require 'spaceline-config)
    ;; 	    ;; (spaceline-spacemacs-theme)
    ;; 	    (setq powerline-default-separator 'wave)
    ;; 	)
    ;;   )

    
    ;; change mode-line color by evil state
    ;; (lexical-let ((default-color (cons (face-background 'mode-line)
    ;; 				       (face-foreground 'mode-line))))
    ;;   (add-hook 'post-command-hook
    ;; 		(lambda ()
    ;; 		  (let ((color (cond ((minibufferp) default-color)
    ;; 				     ((evil-insert-state-p) '("#e80000" . "#FFFFFF"))
    ;; 				     ((evil-emacs-state-p)  '("#444488" . "#FFFFFF"))
    ;; 				     ((buffer-modified-p)   '("#006fa0" . "#FFFFFF"))
    ;; 				     ((evil-visual-state-p) '("#e59400" . "#FFFFFF"))
    ;; 				     (t default-color))))
    ;; 		    (set-face-background 'mode-line (car color))
    ;; 		    (set-face-foreground 'mode-line (cdr color))
    ;; 		    (set-face-background 'mode-line-buffer-id (car color))
    ;; 		    (set-face-foreground 'mode-line-buffer-id (cdr color))))))
    
    ))

(provide 'init-powerline)
;;;
