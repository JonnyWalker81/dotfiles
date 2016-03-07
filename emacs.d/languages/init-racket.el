;;; Code:

(use-package racket-mode
  :ensure racket-mode
  :config
  (progn
    (add-hook 'racket-mode-hook (lambda()
				  (racket-mode)))
    ))

(provide 'init-racket)
;;;
