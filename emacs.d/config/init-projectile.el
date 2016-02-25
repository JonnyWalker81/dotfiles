;;; Code:

(use-package projectile
	     :ensure projectile
	     :config
	     (progn
	       (projectile-mode t)

	       (setq projectile-enable-caching t)
	       (setq projectile-globally-ignored-directories (append '("node_modules" ".svn" ".git") projectile-globally-ignored-directories))
	       (projectile-mode t)
	       ))


(provide 'init-projectile)
;;;
