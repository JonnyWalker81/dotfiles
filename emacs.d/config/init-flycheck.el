;;; Code:

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
    (setq flycheck-swift-sdk-path "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator9.3.sdk")
    (add-to-list 'flycheck-checkers 'swift)
    ))

(defun my-set-ios-sdk-path ()
  (interactive)
  (setq flycheck-swift-sdk-path "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator9.3.sdk"))

(provide 'init-flycheck)
;;;
