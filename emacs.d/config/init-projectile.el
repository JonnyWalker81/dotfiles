;;; Code:

(use-package projectile
  :ensure projectile
  :config
  (progn
    (projectile-mode t)

    (setq projectile-enable-caching t)
    (setq projectile-globally-ignored-directories (append '("node_modules" ".svn" ".git") projectile-globally-ignored-directories))
    (projectile-global-mode)

    (use-package projectile-ripgrep
      :ensure projectile-ripgrep
      :config
      (progn
        ))
    ))

(use-package perspective
  :ensure perspective
  :config
  (progn
    (persp-mode)
    (require 'persp-projectile)
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-persp-switch-project)
    ))


(provide 'init-projectile)
;;;
