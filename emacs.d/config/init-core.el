;;; Code:
;; Core Miscellaneous config
(require 'relative-line-numbers)
(global-relative-line-numbers-mode)

(setq inhibit-startup-screen t)
(setq split-width-threshold most-positive-fixnum)
(setq compilation-read-command nil)

;; from <https://github.com/bling/dotemacs/>
(defmacro after (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

(provide 'init-core)
;;;
