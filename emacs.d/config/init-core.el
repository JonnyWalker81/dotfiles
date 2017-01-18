;; Code:
;; Core Miscellaneous config
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/Users/jrothberg/.emacs.d/lisp/tern/bin"))
(setq exec-path (append exec-path '("/usr/local/bin" "/Users/jrothberg/.emacs.d/lisp/tern/bin" "~/.emacs.d/lisp/tern/bin")))
(setq exec-path (append exec-path '("~/.emacs.d/lisp/tern/bin")))
(setq exec-path (append exec-path '("/Users/jrothberg/.emacs.d/lisp/tern/bin")))
(setq exec-path (append exec-path '("/Users/jrothberg/.emacs.d/lisp/tern")))

(setenv "RLS_ROOT" "~/Repositories/rls")

(require 'dired-x)
(require 'dired+)

(setq diredp-toggle-find-file-reuse-dir 1)
(setq diredp-hide-details-toggled -1)

(setq eshell-highlight-prompt nil)
(setq eshell-ls-use-colors t)

(require 'cl)
(setq tls-checktrust t)

(setq python (or (executable-find "py.exe")
                 (executable-find "python")))
                 

(let ((trustfile
       (replace-regexp-in-string
        "\\\\" "/"
        (replace-regexp-in-string
         "\n" ""
         (shell-command-to-string (concat python " -m certifi"))))))
  (setq tls-program
        (list
         (format "gnutls-cli%s --x509cafile %s -p %%p %%h"
                 (if (eq window-system 'w32) ".exe" "") trustfile)))
  (setq gnutls-verify-error t)
  (setq gnutls-trustfiles (list trustfile)))

(when (executable-find "hunspell")
  (setq-default ispell-program-name "hunspell")
  (setq ispell-really-hunspell t))

(setq ispell-local-dictionary "en_US") ; "en_US" is key to lookup in `ispell-local-dictionary-alist`
(setq ispell-local-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil nil nil utf-8)))
;; Below line specify the ACTUAL dictionary we use
(setq ispell-extra-args '("-d en_US"))

;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)

(org-babel-do-load-languages
 'org-babel-load-languages (quote ((emacs-lisp . t)
                                    (sqlite . t)
                                    (python . t))))

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; (use-package lsp-mode
;;   :ensure lsp-mode
;;   :diminish
;;   :config
;;   (progn
;;     (global-lsp-mode 1)
;;     ))

(use-package visual-regexp
  :ensure visual-regexp
  :diminish
  :config
  (progn

    (use-package visual-regexp-steroids
      :ensure visual-regexp-steroids
      :diminish
      :config
      (progn 
        ))
    
    (define-key global-map (kbd "C-c r") 'vr/replace)
    (define-key global-map (kbd "C-c q") 'vr/query-replace)
    ;; if you use multiple-cursors, this is for you:
    (define-key global-map (kbd "C-c m") 'vr/mc-mark)
    ;; to use visual-regexp-steroids's isearch instead of the built-in regexp isearch, also include the following lines:
    ;; (define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
    ;; (define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
    (define-key global-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s
    (define-key global-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s
    ))

(use-package restclient
  :ensure restclient
  :diminish
  :config
  (progn
    ))

(use-package ox-reveal
  :ensure ox-reveal
  :config
  (progn
    (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0")
    
    ))

(use-package ripgrep
  :ensure ripgrep
  :config
  (progn
    ))
;; (use-package smooth-scrolling
;;   :ensure smooth-scrolling
;;   :config
;;   (progn

;;     ))

;; (smooth-scrolling-mode 1)

(use-package dash
  :ensure dash
  :config
  (progn
    ))

(use-package dash-functional
  :ensure dash-functional
  :config
  (progn
    ))

(use-package smooth-scrolling
  :ensure t
  :config (setq smooth-scroll-margin 2)
  :init (smooth-scrolling-mode 1))


(use-package emmet-mode
  :ensure emmet-mode
  :config
  (progn
    (add-hook 'clojure-mode-hook 'emmet-mode)
    (add-hook 'clojurescript-mode-hook 'emmet-mode)
    (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
    (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
    (setq emmet-move-cursor-between-quotes t)
    (setq emmet-expand-jsx-className? t)
    ))

(setq mouse-wheel-scroll-amount '(1 ((shift) .1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(setq-default indent-tabs-mode nil)

(require 'ox-confluence)
(require 'restclient)

(require 'move-lines)
(move-lines-binding)

(global-prettify-symbols-mode +1)
(setq compilation-scroll-output t)
;; (setq compilation-scroll-output 'first-error)

(require 'whitespace)
(setq whitespace-line-column 120) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'org-mode-hook 'whitespace-mode)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; (setq split-window-preferred-function 'split-window-horizontally)
;; (setq split-height-threshold nil)
;; (setq split-width-threshold most-positive-fixnum)

(defun casey-never-split-a-window
    "Never, ever split a window.  Why would anyone EVER want you to do that??"
    nil)
(setq split-window-preferred-function 'casey-never-split-a-window)

(setq next-line-add-newlines nil)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
(split-window-horizontally)

;; (add-hook 'compilation-mode-hook (lambda()
;; 				   (switch-to-buffer "*compilation*")
;; 				   (other-window 1)))

(defun my-compilation-hook () 
    "Make sure that the compile window is splitting vertically"
    (progn
      (if (not (get-buffer-window "*compilation*"))
         (progn
	    (split-window-horizontally)
	    )
	  )
      )
  )

(add-to-list 'display-buffer-alist
             `(,(rx bos "*compilation*" eos)
               (display-buffer-reuse-window
                display-buffer-in-side-window)
               (reusable-frames . visible)
               (side            . right)
               (window-height   . 0.5)))

;; (add-hook 'compilation-mode-hook 'my-compilation-hook)

(defun my-display-buffer (buffer force-other-window)
  "If BUFFER is visible, select it.

If it's not visible and there's only one window, split the
current window and select BUFFER in the new window. If the
current window (before the split) is more than 165 columns wide,
split horizontally, else split vertically.

If the current buffer contains more than one window, select
BUFFER in the least recently used window.

This function returns the window which holds BUFFER.

FORCE-OTHER-WINDOW is ignored."
  (or (get-buffer-window buffer)
      (if (one-window-p)
          (let ((new-win (if (> (window-width) 165)
                             (split-window-horizontally)
                           (split-window-vertically))))
            (set-window-buffer new-win buffer)
            new-win)
        (let ((new-win (get-lru-window)))
          (set-window-buffer new-win buffer)
          new-win))))

(setq display-buffer-function 'my-display-buffer)

(set-face-attribute 'default nil
                    :family "Source Code Pro for Powerline" :height 145 :weight 'regular)
;; (use-package relative-line-numbers
;;              :ensure relative-line-numbers
;;              :config
;;              (progn
;;                (global-relative-line-numbers-mode)
;;                ))

(use-package relative-line-numbers
  :ensure relative-line-numbers
  :init
  (defun abs-rel-numbers (offset)
    (if (= offset 0)
        (format "%4d " (line-number-at-pos))
      (format "%4d " (abs offset))))
  :config
  (progn
    (global-relative-line-numbers-mode)
    ))

  (setq relative-line-numbers-format #'abs-rel-numbers)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
; (toggle-full-screen)
(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
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

(defun my-compilation-mode-hook ()
  (setq truncate-lines nil) ;; automatically becomes buffer local
  (set (make-local-variable 'truncate-partial-width-windows) nil))
(add-hook 'compilation-mode-hook 'my-compilation-mode-hook)

(defun cycle-powerline-separators (&optional reverse)
  "Set Powerline separators in turn.  If REVERSE is not nil, go backwards."
  (interactive)
  (let* ((fn (if reverse 'reverse 'identity))
         (separators (funcall fn '("arrow" "arrow-fade" "slant"
                                   "chamfer" "wave" "brace" "roundstub" "zigzag"
                                   "butt" "rounded" "contour" "curve")))
         (found nil))
    (while (not found)
      (progn (setq separators (append (cdr separators) (list (car separators))))
             (when (string= (car separators) powerline-default-separator)
               (progn (setq powerline-default-separator (cadr separators))
                      (setq found t)
                      (redraw-display)))))))

(use-package multiple-cursors
  :ensure multiple-cursors
  :config
  (progn))
    
    

;; (defun my-load-project-config ()
;;   (message "loading file...")
;;   (expand-file-name)
;;   )

(defun parse-csv-file (file)
  (interactive
   (list (read-file-name "CSV file: ")))
  (let ((buf (find-file-noselect file))
        (result nil))
    (with-current-buffer buf
      (goto-char (point-min))
      (while (not (eobp))
        (let ((line (buffer-substring-no-properties
                     (line-beginning-position) (line-end-position))))
          (push (split-string line ",") result))
        (forward-line 1)))
    (reverse result)))

;; (add-hook 'prog-mode-hook 'my-load-project-config)

;; Ivy Node
(use-package swiper
  :ensure t
  :bind*
  (
   ("C-c C-s" . swiper)
   ("C-c C-r" . ivy-resume)
   ("C-x C-f" . counsel-find-file)
   ("C-c h f" . counsel-describe-function)
   ("C-c h v" . counsel-describe-variable)
   ("C-c i u" . counsel-unicode-char)
   ("M-i" . counsel-imenu)
   ("C-c g" . counsel-git)
   ("C-c j" . counsel-git-grep)
   ("C-c k" . counsel-ag)
   ("C-c l" . scounsel-locate))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style nil)
    (define-key read-expression-map (kbd "C-r") #'counsel-expression-history)
    (ivy-set-actions
     'counsel-find-file
     '(("d" (lambda (x) (delete-file (expand-file-name x)))
        "delete")))

    ;; (setq swiper-min-highlight nil)
    ;; (set-face-attribute 'ivy-minibuffer-match-face-1 nil
    ;;                     :background nil
    ;;                     :inherit 'default)
    
    ;; (custom-set-faces
    ;;  '(ivy-current-match
    ;;    ((((class color) (background light))
    ;;      :background "red" :foreground "white")
    ;;     (((class color) (background dark))
    ;;      :background "blue" :foreground "black"))))
    
    (ivy-set-actions
     'ivy-switch-buffer
     '(("k"
        (lambda (x)
          (kill-buffer x)
          (ivy--reset-state ivy-last))
        "kill")
       ("j"
        ivy--switch-buffer-other-window-action
        "other window")))))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-on))

(use-package ivy-hydra :ensure t)

(setq dired-use-ls-dired nil)

(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (name   (car (last (split-string parent "/" t)))))
    (when (= (length (window-list)) 1)
      (split-window-horizontally))
    ;; (split-window-horizontally)
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(defun eshell/x ()
  (insert "exit")
  (eshell-send-input)
  (delete-window))

(defun insert-blank-line ()
  "Inserts a blank line."
  (interactive)
  (push (point) buffer-undo-list)
  (evil-insert-newline-below)
  (setq evil-insert-lines t
        evil-insert-vcount nil)
  ;; (evil-insert-state 1)
  ;; (add-hook 'post-command-hook #'evil-maybe-remove-spaces)
  ;; (when evil-auto-indent
  ;;   (indent-according-to-mode))
  )

(defun new-org-note (file-name)
  "Create a new note in the Dropbox folder."
  (interactive "sName:")
  (let ((buffer (generate-new-buffer (format "~/Dropbox/Notes/%s.org" file-name))))
    (switch-to-buffer buffer)
    (write-file (format "~/Dropbox/Notes/%s.org" file-name))
    )
  )

(defun new-txt-note (file-name)
  "Create a new note in the Dropbox folder."
  (interactive "sName:")
  (let ((buffer (generate-new-buffer (format "~/Dropbox/Notes/%s.txt" file-name))))
    (switch-to-buffer buffer)
    (write-file (format "~/Dropbox/Notes/%s.txt" file-name))
    )
  )

(defun new-txt-document (file-name)
  "Create a new note in the Dropbox folder."
  (interactive "sName:")
  (let ((buffer (generate-new-buffer (format "~/Documents/%s.txt" file-name))))
    (switch-to-buffer buffer)
    (write-file (format "~/Documents/%s.txt" file-name))
    )
  )

(setq eshell-history-size 1024)
(setq eshell-prompt-regexp "^[^#$]*[#$] ")

(load "em-hist")           ; So the history vars are defined
(if (boundp 'eshell-save-history-on-exit)
    (setq eshell-save-history-on-exit t)) ; Don't ask, just save
;(message "eshell-ask-to-save-history is %s" eshell-ask-to-save-history)
(if (boundp 'eshell-ask-to-save-history)
    (setq eshell-ask-to-save-history 'always)) ; For older(?) version
;(message "eshell-ask-to-save-history is %s" eshell-ask-to-save-history)

(defun eshell/ef (fname-regexp &rest dir) (ef fname-regexp default-directory))


;;; ---- path manipulation

(defun pwd-repl-home (pwd)
  (interactive)
  (let* ((home (expand-file-name (getenv "HOME"))))
   (home-len (length home)
    (if (and)))
   (>= (length pwd) home-len)
   (equal home (substring pwd 0 home-len)))
  (concat "~" (substring pwd home-len)
      pwd))

(defun curr-dir-git-branch-string (pwd)
  "Returns current git branch as a string, or the empty string if
PWD is not in a git repo (or the git command is not found)."
  (interactive)
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let ((git-output (shell-command-to-string (concat "cd " pwd " && git branch | grep '\\*' | sed -e 's/^\\* //'"))))
      (propertize (concat "[")
                  (if (> (length git-output) 0)
                      (substring git-output 0 -1)
                    "(no branch)")
                  "]") 'face `(:foreground "green"))))
      

;; (setq eshell-prompt-function
;;       (lambda ()
;;         (concat
;;          (propertize ((lambda (p-lst)))
;;             (if (> (length p-lst) 3)
;;                 (concat
;;                  (mapconcat (lambda (elm) (if (zerop (length elm)) ""
;;                                             (substring elm 0 1)))
;;                             (butlast p-lst 3)
;;                             "/")
;;                  "/"
;;                  (mapconcat (lambda (elm) elm)
;;                             (last p-lst 3)
;;                             "/"))
;;               (mapconcat (lambda (elm) elm)
;;                          p-lst
;;                          "/"))
;;           (split-string (pwd-repl-home (eshell/pwd)) "/")) 'face `(:foreground "yellow")
;;          (or (curr-dir-git-branch-string (eshell/pwd)))
;;          (propertize "# " 'face 'default))))

;; (setq eshell-prompt-function
;;       (lambda()
;;         (concat (getenv "USER") "@" (getenv "HOST") ":"
;;                 ((lambda (p-lst)
;;                    (if (> (length p-lst) 3)
;;                        (concat
;;                         (mapconcat (lambda (elm) (substring elm 0 1))
;;                                    (butlast p-lst (- (length p-lst) 3))
;;                                    "/")
;;                         "/"
;;                         (mapconcat (lambda (elm) elm)
;;                                    (last p-lst (- (length p-lst) 3))
;;                                    "/"))
;;                      (mapconcat (lambda (elm) elm)
;;                                 p-lst
;;                                 "/")))
;;                  (split-string (eshell/pwd) "/"))
;;                 (if (= (user-uid) 0) " # " " $ "))))

(setq eshell-highlight-prompt nil)

(provide 'init-core)
;;;Attempt to delete minibuffer or sole ordinary window

