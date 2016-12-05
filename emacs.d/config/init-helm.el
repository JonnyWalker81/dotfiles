;;; Code:

(use-package helm
  :ensure helm
  :config
  
  (evil-leader/set-key
    "b" 'helm-mini
    "s" 'helm-do-ag-project-root
    "ff" 'helm-find-files)

  (progn

    (use-package helm-projectile
      :ensure helm-projectile
      :config
      (progn))

    (setq helm-grep-ag-command "rg --smart-case --no-heading --line-number %s %s %s")

    (use-package helm-ag
      :ensure helm-ag
      :config
      (progn
        (setq helm-ag-base-command "rg --smart-case --no-heading --line-number --vimgrep")
        (setq helm-ag-insert-at-point nil)))))
        

(provide 'init-helm)
;;;
