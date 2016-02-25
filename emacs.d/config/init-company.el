;;; Code:

(use-package company
	     :ensure company
	     :init (add-hook 'after-init-hook 'global-company-mode)
	     :config
	     (progn

		(setq company-tooltip-limit 20)                      ; bigger popup window
		(setq company-idle-delay .1)                         ; decrease delay before autocompletion popup shows
		(setq company-echo-delay 0)                          ; remove annoying blinking
		(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

	       (use-package company-go
			    :ensure company-go
			    :config
			    (progn
			      
				(add-hook 'go-mode-hook (lambda ()
				    (set (make-local-variable 'company-backends) '(company-go))
				    (company-mode)
				    (go-mode-setup)))
			      ))
	       ))

(provide 'init-company)
;;;