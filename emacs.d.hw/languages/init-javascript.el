;;; Package -- Init JavaScript config
;;; Code:
;;; Commentary:

(require 'prettier-js)

(use-package js2-mode
  :ensure js2-mode
  :config
  (progn
    (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
    (add-to-list 'auto-mode-alist '("\\.jsx$\\'" . js2-jsx-mode))
    (add-to-list 'interpreter-mode-alist '("node" . js2-jsx-mode))
    (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
    (setq prettier-width-mode 'fill)
    ;; (add-hook 'js2-mode-hook (lambda () (add-hook 'before-save-hook 'prettier-before-save)))
    ;; (add-hook 'js-mode-hook (lambda () (add-hook 'before-save-hook 'prettier-before-save)))
    (add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))
    (setq-default js-indent-level 2)
    ))

;; (use-package jade
;;   :ensure jade
;;   :config
;;   (progn
;;     (add-hook 'js2-mode-hook #'jade-interaction-mode)))

(use-package web-beautify
  :ensure web-beautify
  :config
  (progn
    ;; (eval-after-load 'js2-mode
    ;;     '(add-hook 'js2-mode-hook
    ;;          (lambda ()
    ;;            (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

    ;; ;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
    ;; (eval-after-load 'js
    ;;     '(add-hook 'js-mode-hook
    ;;         (lambda ()
    ;;             (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

    ;; (eval-after-load 'json-mode
    ;;     '(add-hook 'json-mode-hook
    ;;         (lambda ()
    ;;             (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

    ;; (eval-after-load 'sgml-mode
    ;;     '(add-hook 'html-mode-hook
    ;;         (lambda ()
    ;;             (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

    ;; (eval-after-load 'web-mode
    ;;     '(add-hook 'web-mode-hook
    ;;         (lambda ()
    ;;             (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

    ;; (eval-after-load 'css-mode
    ;;     '(add-hook 'css-mode-hook
    ;;         (lambda ()
    ;;            (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))
    ))
    

(provide 'init-javascript)
;;; init-javascript ends here

