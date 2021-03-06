;;; Code:

(use-package smartparens
  :ensure smartparens
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode)
    (turn-on-show-smartparens-mode)
    (show-smartparens-mode)
    (show-smartparens-global-mode +1)
    
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
    (sp-local-pair 'groovy-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))
    (sp-local-pair 'c++-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))
    (sp-local-pair 'c-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))
    (sp-local-pair 'csharp-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))
    (sp-local-pair 'swift-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))
    (sp-local-pair 'kotlin-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp-kotlin "RET")))
    ;; (sp-local-pair 'kotlin-mode "{" nil :post-handlers nil)
    (sp-local-pair 'javascript-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))
    (sp-local-pair 'java-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))
    (sp-local-pair 'js2-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))
    (sp-local-pair 'tern-mode "{" nil :post-handlers '((my-create-newline-and-enter-sexp "RET")))


    (defun my-create-newline-and-enter-sexp (&rest _ignored)
      "Open a new brace or bracket expression, with relevant newlines and indent. "
      (newline)
      (indent-according-to-mode)
      (forward-line -1)
      (indent-according-to-mode))

    (defun my-create-newline-and-enter-sexp-kotlin (&rest _ignored)
      "Open a new brace or bracket expression, with relevant newlines and indent. "
      (message "kotlin  begin")
      (newline)
      (indent-according-to-mode)
      (forward-line -1)
      (indent-according-to-mode)
      (message "kotlin  end")
      )
    ))

(provide 'init-smartparens)
;;;
