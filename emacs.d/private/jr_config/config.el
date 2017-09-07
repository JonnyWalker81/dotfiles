;;; Misc stuff from my previous config

(defun my-insert-copyright-header()
  "Insert copywrite header to file."
  (interactive)
  (insert "/*\n")
  (insert (format-time-string " * Copyright © 2002-%Y Bluebeam Software, Inc. All Rights Reserved.\n"))
  (insert " * Creator: Jonathan Rothberg\n")
  (insert " */\n")
  )

(defun close-buffers-with-pattern (PATTERN)
  "Close buffers with a certain pattern"
  (interactive "sPattern:")
  (loop for buffer in (buffer-list)
        do (if (string-prefix-p PATTERN (buffer-name buffer))
               (kill-buffer buffer))))
  
