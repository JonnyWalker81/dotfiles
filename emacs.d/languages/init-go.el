;;; Code:

(use-package go-mode
	      :ensure go-mode
	      :config
	      (progn
		(defun go-mode-setup ()
		    ; (setq compile-command "go build -v && go test -v && go vet")
		    (setq compile-command (concat "go run " (buffer-file-name)))
		    (define-key (current-local-map) "\C-c\C-c" 'compile)
		    ; (go-eldoc-setup)
		    (setq gofmt-command "goimports")
		    (add-hook 'before-save-hook 'gofmt-before-save)
		    (local-set-key (kbd "M-.") 'godef-jump))

		(add-hook 'go-mode-hook (lambda ()
		    (set (make-local-variable 'company-backends) '(company-go))
		    (company-mode)
		    (go-mode-setup)))
		))

(provide 'init-go)
;;;
