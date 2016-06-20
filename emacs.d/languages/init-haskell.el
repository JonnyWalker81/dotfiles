;;; Code:

(use-package haskell-mode
  :ensure haskell-mode
  :config
  (progn

    (let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
      (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
      (add-to-list 'exec-path my-cabal-path))
    (custom-set-variables '(haskell-tags-on-save t))

    ))

(use-package hindent
  :ensure hindent
  :config
  (progn
    (add-hook 'haskell-mode-hook #'hindent-mode)
    ))

(use-package ghc
  :ensure ghc
  :config
  (progn

    ))

(use-package shm
  :ensure shm
  :init (add-hook 'haskell-mode-hook 'structured-haskell-mode)
  :config
  (progn

    ))

(provide 'init-haskell)
