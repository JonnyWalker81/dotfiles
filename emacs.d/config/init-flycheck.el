;;; Code:

(use-package flycheck
  :ensure flycheck
  :init (add-to-list 'flycheck-checkers 'swift)
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
