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
    ))

(provide 'init-helm)
;;;
