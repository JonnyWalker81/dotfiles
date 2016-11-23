;;; Code:

(use-package helm
  :ensure helm
  :config
  
  (evil-leader/set-key
    "b" 'helm-mini
    "s" 'helm-do-grep-ag
    "ff" 'helm-find-files)

  (progn

    (use-package helm-projectile
      :ensure helm-projectile
      :config
      (progn))

    (setq helm-grep-ag-command "rg --smart-case --no-heading --line-number %s %s %s")))

(provide 'init-helm)
;;;
