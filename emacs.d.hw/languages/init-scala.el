;;; Code:

(use-package ensime
  :ensure ensime
  :config
  (progn
    (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
    ))

(provide 'init-scala)
