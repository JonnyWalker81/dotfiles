;;; Code:

    (use-package spaceline
      :ensure spaceline
      :config
      (progn
	(require 'powerline)
	(require 'spaceline-config)
	    (spaceline-spacemacs-theme)
	    ;; (setq powerline-default-separator 'utf-8)
	    (setq powerline-default-separator 'arrow)
	    (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
	    (setq spaceline-window-numbers-unicode t)
	    (setq spaceline-workspace-numbers-unicode t)
	    ;; (setq powerline-default-separator 'wave)
	)
      )

(provide 'init-spaceline)
;;;
