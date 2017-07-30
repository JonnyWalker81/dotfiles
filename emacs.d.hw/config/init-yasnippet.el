;;; Code:

;; (use-package yasnippet
;;   :ensure yasnippet
;;   :config
;;   (progn
;;     (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
;;     ))

(use-package yasnippet
  :load-path "lisp/"
  :defer t
  :config
  (progn
    (setq yas-snippet-dirs '("~/Repositories/yasnippet-snippets"))
    (yas-global-mode 1)
    ))
(provide 'init-yasnippet)
;;;
