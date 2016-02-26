;;; Code:
;; Core Miscellaneous config
(require 'relative-line-numbers)
(global-relative-line-numbers-mode)

(setq inhibit-startup-screen t)
(setq split-width-threshold most-positive-fixnum)
(setq compilation-read-command nil)
(define-key global-map (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

;; from <https://github.com/bling/dotemacs/>
(defmacro after (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

(provide 'init-core)
;;;
