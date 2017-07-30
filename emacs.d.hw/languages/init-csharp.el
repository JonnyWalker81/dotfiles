;;; Code:

(require 'csharp-mode)
(use-package omnisharp
  :ensure omnisharp
  :config
  (progn
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-omnisharp))

(add-hook 'csharp-mode-hook 'omnisharp-mode)
(setq omnisharp-server-executable-path "/Users/jrothberg/Repositories/omnisharp-roslyn/src/OmniSharp/bin/Release/netcoreapp1.0/osx.10.11-x64/OmniSharp")
(setq omnisharp--curl-executable-path "/usr/bin/curl")
(setq omnisharp-debug t)
    ))

(provide 'init-csharp)
;;;
