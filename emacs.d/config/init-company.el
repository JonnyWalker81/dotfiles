;;; Code:

(use-package company
  :ensure company
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (progn

    (setq company-tooltip-limit 10)                      ; bigger popup window
    (setq company-idle-delay 0.1)                         ; decrease delay before autocompletion popup shows
    (setq company-echo-delay 0)                          ; remove annoying blinking
    (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
    (setq company-async-timeout 10)

    (require 'company-rtags)
    (push 'company-rtags company-backends)
    (global-company-mode)

    (use-package company-go
      :ensure company-go
      :config
      (progn
        
        (add-hook 'go-mode-hook (lambda ()
                                  (set (make-local-variable 'company-backends) '(company-go))
                                  (company-mode)
                                  (go-mode-setup)))
        ))
    ;; (use-package company-sourcekit
    ;;   :ensure company-sourcekit
    ;;   :init (add-to-list 'company-backends 'company-sourcekit)
    ;;   :config
    ;;   (progn
    ;;     ;; (setq sourcekit-verbose nil)
    ;;     ;; (setq company-sourcekit-verbose nil)
    ;;     ;; (defadvice sourcekit-project (after find-git-rel-project activate)
    ;;     ;;   (message "advice...")
    ;;     ;;   (setq ad-return-value "/Users/jrothberg/Repositories/Mako/mako.xcodeproj")
    ;;     ;;   )
    ;;     ))

    (use-package company-ghc
      :ensure company-ghc
      :init (add-to-list 'company-backends 'company-ghc)
      :config
      (progn
        (custom-set-variables '(company-ghc-show-info t))
        ))

    (use-package company-tern
      :ensure company-tern
      :config
      (progn
        (add-to-list 'company-backends 'company-tern)
        ))
    
    ))



(provide 'init-company)
;;;
