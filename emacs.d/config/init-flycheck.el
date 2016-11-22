;;; Code:

(require 'flycheck-flow)

(use-package flycheck
  :ensure flycheck
  ;; :init (add-to-list 'flycheck-checkers 'swift)
  :config
  (progn
    (global-flycheck-mode)
    (add-hook 'flycheck-mode-hook
              (lambda()
                (evil-leader/set-key
                  "fc" 'flycheck-buffer)))

    (defvar flycheck-swift-sdk-path)
    (setq flycheck-swift-sdk-path "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator10.0.sdk")
    (add-to-list 'flycheck-checkers 'swift)
    (add-hook 'js2-mode-hook 'flycheck-mode)
    (flycheck-add-next-checker 'javascript-flow)
    ))

(defun my-set-ios-sdk-path ()
  (interactive)
  (setq flycheck-swift-sdk-path "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator10.0.sdk"))

(provide 'init-flycheck)
;;;
