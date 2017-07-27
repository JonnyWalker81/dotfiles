;;; Package -- Summary ;;
;;; Commentary:
                                        ; Emacs init.el file, I will try to keep this file clean and dlegate to other init files.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:
(require 'package)
(package-initialize)

(setq package-enable-at-startup nil)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
      (unless (package-installed-p 'use-package)
          (package-refresh-contents)
          (package-install 'use-package))

(use-package org
  :ensure org)
  

(require 'org)
(require 'ob-table)

(setq emacs-directory "~/.emacs.d/")
(setq custom-file (concat emacs-directory "custom.el"))
(load custom-file)

(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))

(setq init-dir (file-name-directory (or load-file-name (buffer-file-name))))
(org-babel-load-file (expand-file-name "loader.org" init-dir))

(provide 'init)

;;;
(put 'dired-find-alternate-file 'disabled nil)
