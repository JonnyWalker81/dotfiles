;;; Package -- Init JavaScript config
;;; Code:
;;; Commentary:

(use-package js2-mode
  :ensure js2-mode
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
    (add-to-list 'auto-mode-alist '("\\.jsx$\\'" . js2-jsx-mode))
    (add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
    (add-hook 'js2-mode-hook (lambda () (tern-mode t)))))

(use-package jade
  :ensure jade
  :config
  (progn
    (add-hook 'js2-mode-hook #'jade-interaction-mode)))

(provide 'init-javascript)
;;; init-javascript ends here

