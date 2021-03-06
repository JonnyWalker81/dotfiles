;;; Code:

(require 'rtags)
(require 'clang-format)

(add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)

;; Hook function
(defun clang-format-before-save ()
  "Add this to .emacs to clang-format on save
 (add-hook 'before-save-hook 'clang-format-before-save)."

  (interactive)
  (when (eq major-mode 'c++-mode) (clang-format-buffer)))

;; Install hook to use clang-format on save
(add-hook 'before-save-hook 'clang-format-before-save)

(defun my-c++-insert-header (file-name)
  "Insert a header into a C++ Header file.
	FILE-NAME: name of file to create."
  (interactive "sName of File: ")
  (my-c++-create-header-file file-name)
  (my-c++-create-implementation-file file-name)
  )

(defun my-c++-create-header-file (file-name)
  "internal function to create a header file for a C++ class.
	FILE-NAME: name of class to create."
  (let ((buffer (generate-new-buffer (format "%s.hpp" file-name))))
    (message "%s" buffer)
    (switch-to-buffer buffer)
    (my-insert-copyright-header)
    (insert "\n")
    (insert "#pragma once\n\n")
    (insert (format "class %s\n" file-name))
    (insert "{\n")
    (insert "public:\n")
    (insert (format "  %s();\n\n" file-name))
    (insert "private:\n\n")
    (insert "};\n")
    (write-file (format "%s.hpp" file-name))
    ))

(defun my-c++-create-implementation-file (file-name)
  "Create an implementation file (.cpp)
       FILE-NAME: name of file to create"
  (let ((buffer (generate-new-buffer (format "%s.cpp" file-name))))
    (switch-to-buffer buffer)
    (my-insert-copyright-header)
    (insert "\n")
    (insert (format "#include \"%s.hpp\"\n\n" file-name))
    (insert (format "%s::%s(){\n\n" file-name file-name))
    (insert "}\n")
    (write-file (format "%s.cpp" file-name))
    )
  )

(defun my-insert-copyright-header()
  "Insert copywrite header to file."
  (interactive)
  (insert "/*\n")
  (insert (format-time-string " * Copyright © 2002-%Y Bluebeam Software, Inc. All Rights Reserved.\n"))
  (insert " * Creator: Jonathan Rothberg\n")
  (insert " */\n")
  )
(provide 'init-c++)
;;;
