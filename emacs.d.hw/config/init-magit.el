;;; Code:

(use-package magit
  :ensure magit
  :config
  (progn

    (use-package evil-magit
      :ensure evil-magit
      :config
      (progn
	))

    (vc-mode-line t)

    ))

(provide 'init-magit)
;;;
