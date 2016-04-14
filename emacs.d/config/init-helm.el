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

    (custom-set-variables
 '(helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
 '(helm-ag-command-option "--all-text")
 '(helm-ag-insert-at-point 'symbol))
    
    (use-package helm-ag
      :ensure helm-ag
      :config
      (progn
	;; (setq helm-ag-always-set-extra-option nil)
	))
    ))

(provide 'init-helm)
;;;
