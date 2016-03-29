;;; Code:

;; (use-package yasnippet
;;   :ensure yasnippet
;;   :config
;;   (progn
;;     (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
;;     ))

(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)
(provide 'init-yasnippet)
;;;
