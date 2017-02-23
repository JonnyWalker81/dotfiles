;;; Code:

(use-package cider
  :ensure cider
  :config
  (progn
    (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
    (setq nrepl-popup-stacktraces nil)
    (add-to-list 'same-window-buffer-names "<em>nrepl</em>")))

(use-package clojure-mode
  :ensure clojure-mode
  :config
  (progn
    (defun clojure-mode-setup ()
                                        ; (setq compile-command "go build -v && go test -v && go vet")
      (setq compile-command "lein run")
      (define-key (current-local-map) "\C-c\C-c" 'compile))
                                        ; (go-eldoc-setup)

    (add-hook 'clojure-mode-hook (lambda ()
                                   (clojure-mode-setup)))))
(use-package lispy
  :ensure lispy
  :config
  (progn

    ))

(use-package parinfer
  :ensure t
  :bind
  (("C-," . parinfer-toggle-mode))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
             pretty-parens  ; different paren styles for different modes.
             evil           ; If you use Evil.
             lispy          ; If you use Lispy. With this extension, you should install Lispy and do not enable lispy-mode directly.
             smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
             smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)))

(use-package paredit
  :ensure paredit)

(use-package popup
  :ensure popup)

(use-package rainbow-delimiters
  :ensure rainbow-delimiters
  :config
  (rainbow-delimiters-mode))

(use-package rainbow-mode
  :ensure rainbow-mode
  :config
  (progn
    (rainbow-mode)))

(provide 'init-clojure)
;;;
