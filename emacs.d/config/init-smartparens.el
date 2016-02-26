;;; Code:

(use-package smartparens
  :ensure smartparens
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode)
    
    ;; (defun my-open-block-c-mode (id action context)
    ;;   (when (eq action 'insert)
    ;; 	(newline)
    ;; 	(newline)
    ;; 	(indent-according-to-mode)
    ;; 	(previous-line)
    ;; 	(indent-according-to-mode)

    ;; 	(sp-local-pair 'go-mode "{" nil :post-handlers '(:add my-open-block-c-mode))

	(sp-local-pair 'go-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))
	(sp-local-pair 'rust-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))

	(defun my-create-newline-and-enter-sexp (&rest _ignored)
	  "Open a new brace or bracket expression, with relevant newlines and indent. "
	  (newline)
	  (indent-according-to-mode)
	  (forward-line -1)
	  (indent-according-to-mode))

    ))

(provide 'init-smartparens)
;;;
