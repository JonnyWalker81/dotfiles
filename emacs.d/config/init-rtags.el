;;; Code:

(require 'rtags)

(setq rtags-rdm-process-use-pipe t)
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)

(provide 'init-rtags)
;;;
