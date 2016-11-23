;; Code:
;; Core Miscellaneous config
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/Users/jrothberg/.emacs.d/lisp/tern/bin"))
(setq exec-path (append exec-path '("/usr/local/bin" "/Users/jrothberg/.emacs.d/lisp/tern/bin" "~/.emacs.d/lisp/tern/bin")))
(setq exec-path (append exec-path '("~/.emacs.d/lisp/tern/bin")))
(setq exec-path (append exec-path '("/Users/jrothberg/.emacs.d/lisp/tern/bin")))
(setq exec-path (append exec-path '("/Users/jrothberg/.emacs.d/lisp/tern")))

(require 'dired-x)
(require 'dired+)

(setq diredp-toggle-find-file-reuse-dir 1)
(setq diredp-hide-details-toggled -1)
      
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
(setq whitespace-line-column 80) ;; limit line length
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
  (("C-s" . swiper)
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
    (define-key read-expression-map (kbd "C-r") #'counsel-expression-history)
    (ivy-set-actions
     'counsel-find-file
     '(("d" (lambda (x) (delete-file (expand-file-name x)))
        "delete")))
    
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

(provide 'init-core)
;;;
