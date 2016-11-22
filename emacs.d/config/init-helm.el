;;; Code:

(use-package helm
  :ensure helm
  :config
  
  (evil-leader/set-key
    "b" 'helm-mini)

  (progn

    (use-package helm-projectile
      :ensure helm-projectile
      :config
      (progn
	))

 ;;    (custom-set-variables
 ;; '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
 ;; '(helm-ag-command-option "--all-text")
 ;; '(helm-ag-insert-at-point 'symbol))


    (custom-set-variables
 '(helm-ag-base-command "rg --vimgrep --no-heading"))

    (setq helm-grep-ag-command "rg --smart-case --no-heading --line-number %s %s %s")
    (setq helm-grep-git-grep-command "rg --smart-case --no-heading --line-number")
    (setq helm-ag-base-command "rg --vimgrep --no-heading")
    
    (use-package helm-ag
      :ensure helm-ag
      :config
      (progn
	;; (setq helm-ag-always-set-extra-option nil)
	))
    ))

(provide 'init-helm)
;;;
