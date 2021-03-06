;;; packages.el --- jr_config layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Jonathan Rothberg <jrothberg@jrothbergmacbookpro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `jr_config-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `jr_config/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `jr_config/pre-init-PACKAGE' and/or
;;   `jr_config/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst jr_config-packages
  '(
    kotlin-mode
    gradle-mode
    flycheck-kotlin
    groovy-mode
    )
  "The list of Lisp packages required by the jr_config layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun jr_config/init-kotlin-mode ()
  (message "init-kotlin-mode loading...")
  (use-package kotlin-mode
    :ensure kotlin-mode
  )
    ;; (add-to-list 'auto-mode-alist '("\\.kt$" . kotlin-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.kts$" . kotlin-mode))
  )

(defun jr_config/init-gradle-mode ()
  (message "init-gradle-mode loading...")
  (use-package gradle-mode
    :ensure gradle-mode
    :config
    (progn
      ;;;###autoload
      (add-to-list 'auto-mode-alist '("\\.gradle\\'" . gradle-mode) t)
      (gradle-mode 1)))
  )

(defun jr_config/init-groovy-mode ()
  (use-package groovy-mode
    :defer t
    :mode ("\\.groovy\\'" . groovy-mode)
    :init
    (progn
      (add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode) t)
      (setq c-basic-offset 4)))
)

(defun jr_config/init-flycheck-kotlin ())

(defun jr_config/post-init-flycheck ()
  (add-hook 'kotlin-mode-hook 'flycheck-mode))

;;; packages.el ends here
