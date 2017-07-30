;;; Code:

(use-package groovy-mode
  :ensure groovy-mode
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
    (add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
    (add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
    
;;; make Groovy mode electric by default.
    (add-hook 'groovy-mode-hook
	      '(lambda ()
		 ;; (require 'groovy-electric)
		 ;; (groovy-electric-mode)
		 ))
    ))

(provide 'init-groovy)
;;;
