;;; Code:
;; Neotree config

(use-package neotree
	     :ensure neotree
	     :config
	     (progn
		(add-hook 'neotree-mode-hook
		    (lambda ()
			(define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
			(define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)

			(define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
			(define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)
			(define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

		(setq neo-smart-open t)

	     ))


(provide 'init-neotree)
;;;
