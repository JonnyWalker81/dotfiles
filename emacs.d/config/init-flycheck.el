;;; Code:

(use-package flycheck
	     :ensure flycheck
	     :config
	     (progn
	       (global-flycheck-mode)
	       (add-hook 'flycheck-mode-hook
			 (lambda()
			   (evil-leader/set-key
			     "fc" 'flycheck-buffer)))
	       ))

(provide 'init-flycheck)
;;;
