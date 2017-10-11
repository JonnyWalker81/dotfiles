;;; packages.el --- custom-swift layer packages file for Spacemacs.
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
;; added to `custom-swift-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `custom-swift/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `custom-swift/pre-init-PACKAGE' and/or
;;   `custom-swift/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst custom-swift-packages
  '(
    auto-completion
    company
    flycheck
    swift-mode
    (company-sourcekit :location (recipe :fetcher github :repo "nathankot/company-sourcekit" :files "company-sourcekit.el"))
    )
  "The list of Lisp packages required by the custom-swift layer.

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


;;; packages.el ends here


(when (configuration-layer/layer-usedp `auto-completion)
  (defun custom-swift/post-init-company()
    (spacemacs|add-company-hook swift-mode))

  (defun custom-swift/init-company-sourcekit ()
    (use-package company-sourcekit
      :if (configuration-layer/layer-usedp `company)
      :defer t
      :init

      ))

  (defun custom-swift/post-init-company ()
    (spacemacs|add-company-backends
      :backends company-sourcekit
      :modes swift-mode
      :variables company-swift-show-annotation t)
    ;; (push `company-sourcekit company-backends-swift-mode)
    )
  )

(defun custom-swift/post-init-flycheck()
  (spacemacs|use-package-add-hook flycheck-color-mode-line-error-face
             :post-config (add-to-list `flycheck-checkers `swift)))

(defun custom-swift/init-swift-mode ()
  (use-package swift-mode
    :mode ("\\.swift\\'" . swift-mode)
    :defer t
    :init
    (progn
      (spacemacs|advise-commands "store-initial-buffer-name"
                                 (swift-mode-run-repl) around
       "Store current buffer bane in bufffer local variable,
before activiting or switching to REPL."
       (let ((initial-buffer (current-buffer)))
         ad-do-it
         (with-current-buffer swift-repl-buffer
           (setq swift-repl-mode-previous-buffer initial-buffer))))

      (defun spacemacs/swift-repl-mode-hook ()
        "Hook to run when starting an interactive swift mode repl"
        (make-variable-buffer-local 'swift-repl-mode-previous-buffer))
      (add-hook 'swift-repl-mode-hook 'spacemacs/swift-repl-mode-hook)

      (defun spacemacs/swift-repl-mode-switch-back ()
        "Switch back to from REPL to editor."
        (interactive)
        (if swift-repl-mode-previous-buffer
            (switch-to-buffer-other-window swift-repl-mode-previous-buffer)
          (message "No previous buffer"))))
    :config
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'swift-mode
        "sS" 'swift-mode-run-repl      ; run or switch to an existing swift repl
        "ss" 'swift-mode-run-repl
        "sb" 'swift-mode-send-buffer
        "sr" 'swift-mode-send-region)

      (use-package company-sourcekit
        :ensure company-sourcekit
        :init (add-to-list 'company-backends 'company-sourcekit)
        :config
        (progn
          ;; (setq sourcekit-verbose nil)
          ;; (setq company-sourcekit-verbose nil)
          ;; (defadvice sourcekit-project (after find-git-rel-project activate)
          ;;   (message "advice...")
          ;;   (setq ad-return-value "/Users/jrothberg/Repositories/Mako/mako.xcodeproj")
          ;;   )
          ))

      (use-package flycheck-swift
        :ensure flycheck-swift
        :config
        (progn
          (eval-after-load 'flycheck '(flycheck-swift-setup))
          (setq flycheck-swift-target "arm64-apple-ios10")
          ))

      (with-eval-after-load 'swift-repl-mode-map
        ;; Switch back to editor from REPL
        (spacemacs/set-leader-keys-for-major-mode 'swift-repl-mode
          "ss"  'spacemacs/swift-repl-mode-switch-back)
        (define-key swift-repl-mode-map
          (kbd "C-c C-z") 'spacemacs/swift-repl-mode-switch-back)))))

