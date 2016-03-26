;;; Code:
;; Config for Rust language


(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(use-package racer
  :ensure racer
  :config
  (progn
    (add-hook 'rust-mode-hook #'racer-mode)
    (add-hook 'racer-mode-hook #'eldoc-mode)
    (setq racer-cmd "~/.cargo/bin/racer")
    (setq racer-rust-src-path "~/.multirust/toolchains/nightly/src/")

    (use-package company-racer
      :ensure company-racer
      :config
      (progn
	(add-hook 'racer-mode-hook #'company-mode)

	))
    ))

(provide 'init-rust)
;;;
