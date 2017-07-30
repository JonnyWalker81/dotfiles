;; Code:
;; Core Miscellaneous config
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/Users/jrothberg/.emacs.d/lisp/tern/bin"))
(setq exec-path (append exec-path '("/usr/local/bin" "/Users/jrothberg/.emacs.d/lisp/tern/bin" "~/.emacs.d/lisp/tern/bin")))
(setq exec-path (append exec-path '("~/.emacs.d/lisp/tern/bin")))
(setq exec-path (append exec-path '("/Users/jrothberg/.emacs.d/lisp/tern/bin")))
(setq exec-path (append exec-path '("/Users/jrothberg/.emacs.d/lisp/tern")))

(setenv "RLS_ROOT" "~/Repositories/rls")

;; (require 'dired-x)
;; (require 'dired+)

(require 'fic-mode)
(add-hook 'prog-mode-hook 'fic-mode)

;; (use-package aggressive-indent
;;   :ensure aggressive-indent
;;   :config
;;   (progn

;;     (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
;;     (add-hook 'css-mode-hook #'aggressive-indent-mode)
;;     (add-hook 'kotlin-mode #'aggressive-indent-mode)
;;     ))

(defun my/dired-mode-hook ()
  ""
  (toggle-truncate-lines 1))

(use-package dired
  :bind ("C-x C-j" . dired-jump)
  :config
  (use-package dired-x
    :init (setq-default dired-omit-files-p t)
    :config
    (add-to-list 'dired-omit-extensions ".DS_Store"))
  (customize-set-variable 'diredp-hide-details-initially-flag nil)
  (use-package dired+
    :ensure t)
  (use-package dired-aux
    :init
    (use-package dired-async
      :ensure async))
  (put 'dired-find-alternate-file 'disabled nil)
  (setq ls-lisp-dirs-first t
        dired-recursive-copies 'always
        dired-recursive-deletes 'always
        dired-dwim-target t
        ;; -F marks links with @
        dired-ls-F-marks-symlinks t
        delete-by-moving-to-trash t
        ;; Auto refresh dired
        global-auto-revert-non-file-buffers t
        wdired-allow-to-change-permissions t)
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "C-M-u") 'dired-up-directory)
  (define-key dired-mode-map (kbd "M-o") #'my/dired-open)
  (define-key dired-mode-map (kbd "C-x C-q") 'wdired-change-to-wdired-mode)
  (bind-key "l" #'dired-up-directory dired-mode-map)
  (bind-key "M-!" #'async-shell-command dired-mode-map)
  (add-hook 'dired-mode-hook #'hl-line-mode)
  (add-hook 'dired-mode-hook #'my/dired-mode-hook))


(use-package saveplace
  :ensure saveplace
  :defer t
  :init
  (setq-default save-place t)
  (setq save-place-file (expand-file-name ".places" user-emacs-directory)))

;; recentf

;; Set up keeping track of recent files, up to 2000 of them.
;; If emacs has been idle for 10 minutes, clean up the recent files. Also save the list of recent files every 5 minutes.

;; This also only enables recentf-mode if idle, so that emacs starts up faster.
(use-package recentf
  :defer 10
  :commands (recentf-mode
             recentf-add-file
             recentf-apply-filename-handlers)
  :init
  (setq recentf-max-saved-items 300
        recentf-exclude '("/auto-install/" ".recentf" "/repos/" "/elpa/"
                          "\\.mime-example" "\\.ido.last" "COMMIT_EDITMSG"
                          ".gz"
                          "~$" "/tmp/" "/ssh:" "/sudo:" "/scp:")
        recentf-auto-cleanup 600)
  (when (not noninteractive) (recentf-mode 1))

  (defun recentf-save-list ()
    "Save the recent list.
Load the list from the file specified by `recentf-save-file',
merge the changes of your current session, and save it back to
the file."
    (interactive)
    (let ((instance-list (cl-copy-list recentf-list)))
      (recentf-load-list)
      (recentf-merge-with-default-list instance-list)
      (recentf-write-list-to-file)))

  (defun recentf-merge-with-default-list (other-list)
    "Add all items from `other-list' to `recentf-list'."
    (dolist (oitem other-list)
      ;; add-to-list already checks for equal'ity
      (add-to-list 'recentf-list oitem)))

  (defun recentf-write-list-to-file ()
    "Write the recent files list to file.
Uses `recentf-list' as the list and `recentf-save-file' as the
file to write to."
    (condition-case error
        (with-temp-buffer
          (erase-buffer)
          (set-buffer-file-coding-system recentf-save-file-coding-system)
          (insert (format recentf-save-file-header (current-time-string)))
          (recentf-dump-variable 'recentf-list recentf-max-saved-items)
          (recentf-dump-variable 'recentf-filter-changer-current)
          (insert "\n \n;;; Local Variables:\n"
                  (format ";;; coding: %s\n" recentf-save-file-coding-system)
                  ";;; End:\n")
          (write-file (expand-file-name recentf-save-file))
          (when recentf-save-file-modes
            (set-file-modes recentf-save-file recentf-save-file-modes))
          nil)
      (error
       (warn "recentf mode: %s" (error-message-string error)))))
  (recentf-mode 1))

(use-package shackle
  :ensure shackle
  :config
  (progn
    (setq helm-display-function 'pop-to-buffer) ; make helm play nice
    (setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :size 0.4)))
    ))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq diredp-toggle-find-file-reuse-dir 1)
(setq diredp-hide-details-toggled -1)

(setq eshell-highlight-prompt nil)
(setq eshell-ls-use-colors t)

(require 'cl)
(setq tls-checktrust t)

(setq line-move-visual t)
(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'text-mode-hook 'turn-on-auto-fill)

(defadvice kill-buffer (around kill-buffer-around-advice activate)
  (let ((buffer-to-kill (ad-get-arg 0)))
    (if (equal buffer-to-kill "*scratch*")
        (bury-buffer)
      ad-do-it)))

(global-auto-revert-mode 1)

;; Lame, server has bad autoloads :(
(require 'server nil t)
(use-package server
  :ensure server
  :if window-system
  :init
  (when (not (server-running-p server-name))
    (server-start)))

(use-package helm-flx
  :ensure helm-flx
  :init (helm-flx-mode +1))

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

;; (use-package ripgrep
;;   :ensure ripgrep
;;   :config
;;   (progn
;;     ))

;; (use-package projectile-ripgrep
;;   :ensure projectile-ripgrep
;;   :config
;;   (progn

;;     ))
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
  :defer t
  :ensure t
  :config (progn
            (setq smooth-scroll-margin 3
                  scroll-margin 3
                  scroll-conservatively 101
                  scroll-preserve-screen-position t
                  auto-window-vscroll nil))
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

(use-package golden-ratio
  :ensure golden-ratio
  :diminish golden-ratio-mode
  :defer t
  :config
  (defun my/helm-alive-p ()
    (if (boundp 'helm-alive-p)
        (symbol-value 'helm-alive-p)))
  (add-to-list 'golden-ratio-exclude-modes #'messages-buffer-mode)
  (add-to-list 'golden-ratio-exclude-modes #'fundamental-mode)
  ;; Inhibit helm
  (add-to-list 'golden-ratio-inhibit-functions #'my/helm-alive-p))

;; (use-package git-gutter
;;   :ensure git-gutter
;;   :defer t
;;   :bind (("C-x =" . git-gutter:popup-hunk)
;;          ("C-c P" . git-gutter:previous-hunk)
;;          ("C-c N" . git-gutter:next-hunk)
;;          ("C-x p" . git-gutter:previous-hunk)
;;          ("C-x n" . git-gutter:next-hunk)
;;          ("C-c G" . git-gutter:popup-hunk))
;;   :diminish ""
;;   :init
;;   (add-hook 'prog-mode-hook 'git-gutter-mode)
;;   (add-hook 'org-mode-hook 'git-gutter-mode))

(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
                             "python -mjson.tool" (current-buffer) t)))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defvar bad-cleanup-modes '(python-mode yaml-mode)
  "List of modes where `cleanup-buffer' should not be used")

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a
buffer. If the buffer is one of the `bad-cleanup-modes' then no
re-indenting and un-tabification is done."
  (interactive)
  (unless (member major-mode bad-cleanup-modes)
    (progn
      (indent-buffer)
      (untabify-buffer)))
  (delete-trailing-whitespace))

;; Perform general cleanup.
(global-set-key (kbd "C-c n") #'cleanup-buffer)

(defun transpose-buffers (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

(global-set-key (kbd "C-x 4 t") 'transpose-buffers)


(require 'ox-confluence)
(require 'restclient)

(require 'move-lines)
(move-lines-binding)

(global-prettify-symbols-mode +1)
(setq compilation-scroll-output t)
;; (setq compilation-scroll-output 'first-error)

(require 'whitespace)
(setq whitespace-line-column 120) ;; limit line length
;; (setq whitespace-style '(face lines-tail))

;; (setq whitespace-style '(tabs newline space-mark
;;                               tab-mark newline-mark
;;                               face lines-tail))

(progn
  ;; Make whitespace-mode with very basic background coloring for whitespaces.
  ;; http://ergoemacs.org/emacs/whitespace-mode.html
  (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark)))

  ;; Make whitespace-mode and whitespace-newline-mode use “¶” for end of line char and “▷” for tab.
  (setq whitespace-display-mappings
        ;; all numbers are unicode codepoint in decimal. e.g. (insert-char 182 1)
        '(
          (space-mark 32 [183] [46]) ; SPACE 32 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
          (newline-mark 10 [182 10]) ; LINE FEED,
          (tab-mark 9 [9655 9] [92 9])))) ; tab


;; (setq whitespace-display-mappings
;;       ;; all numbers are Unicode codepoint in decimal. e.g. (insert-char 182 1)
;;       ;; 32 SPACE, 183 MIDDLE DOT
;;       '((space-mark nil)
;;         ;; 10 LINE FEED
;;         ;;(newline-mark 10 [172 10])
;;         (newline-mark nil)
;;         ;; 9 TAB, MIDDLE DOT
;;         (tab-mark 9 [183 9] [92 9])))

(setq-default show-trailing-whitespace nil)

(add-hook 'prog-mode-hook #'hl-line-mode)

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

(defun casey-never-split-a-window ()
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
                    ;; :family "Source Code Pro for Powerline" :height 145 :weight 'regular)
                    ;; :family "Anonymous Pro for Powerline" :height 175 :weight 'regular)
                    :family "Fira Code" :height 175 :weight 'medium)
;; :family "SF UI Text" :height 175 :weight 'medium)
;; (use-package relative-line-numbers
;;              :ensure relative-line-numbers
;;              :config
;;              (progn
;;                (global-relative-line-numbers-mode)
;;                ))

;; (when (window-system)
;;   (set-default-font "Fira Code"))
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)"))))

  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

;;; Fira code
;; This works when using emacs --daemon + emacsclient
;; (add-hook 'after-make-frame-functions (lambda (frame) (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")))
;; This works when using emacs without server/client
;; (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")
;; I haven't found one statement that makes both of the above situations work, so I use both for now

(defconst fira-code-font-lock-keywords-alist
  (mapcar (lambda (regex-char-pair)
            `(,(car regex-char-pair)
              (0 (prog1 ()
                   (compose-region (match-beginning 1)
                                   (match-end 1)
                                   ;; The first argument to concat is a string containing a literal tab
                                   ,(concat "   " (list (decode-char 'ucs (cadr regex-char-pair)))))))))
          '(("\\(www\\)"                   #Xe100)
            ("[^/]\\(\\*\\*\\)[^/]"        #Xe101)
            ("\\(\\*\\*\\*\\)"             #Xe102)
            ("\\(\\*\\*/\\)"               #Xe103)
            ("\\(\\*>\\)"                  #Xe104)
            ("[^*]\\(\\*/\\)"              #Xe105)
            ("\\(\\\\\\\\\\)"              #Xe106)
            ("\\(\\\\\\\\\\\\\\)"          #Xe107)
            ("\\({-\\)"                    #Xe108)
            ("\\(\\[\\]\\)"                #Xe109)
            ("\\(::\\)"                    #Xe10a)
            ("\\(:::\\)"                   #Xe10b)
            ("[^=]\\(:=\\)"                #Xe10c)
            ("\\(!!\\)"                    #Xe10d)
            ("\\(!=\\)"                    #Xe10e)
            ("\\(!==\\)"                   #Xe10f)
            ("\\(-}\\)"                    #Xe110)
            ("\\(--\\)"                    #Xe111)
            ("\\(---\\)"                   #Xe112)
            ("\\(-->\\)"                   #Xe113)
            ("[^-]\\(->\\)"                #Xe114)
            ("\\(->>\\)"                   #Xe115)
            ("\\(-<\\)"                    #Xe116)
            ("\\(-<<\\)"                   #Xe117)
            ("\\(-~\\)"                    #Xe118)
            ("\\(#{\\)"                    #Xe119)
            ("\\(#\\[\\)"                  #Xe11a)
            ("\\(##\\)"                    #Xe11b)
            ("\\(###\\)"                   #Xe11c)
            ("\\(####\\)"                  #Xe11d)
            ("\\(#(\\)"                    #Xe11e)
            ("\\(#\\?\\)"                  #Xe11f)
            ("\\(#_\\)"                    #Xe120)
            ("\\(#_(\\)"                   #Xe121)
            ("\\(\\.-\\)"                  #Xe122)
            ("\\(\\.=\\)"                  #Xe123)
            ("\\(\\.\\.\\)"                #Xe124)
            ("\\(\\.\\.<\\)"               #Xe125)
            ("\\(\\.\\.\\.\\)"             #Xe126)
            ("\\(\\?=\\)"                  #Xe127)
            ("\\(\\?\\?\\)"                #Xe128)
            ("\\(;;\\)"                    #Xe129)
            ("\\(/\\*\\)"                  #Xe12a)
            ("\\(/\\*\\*\\)"               #Xe12b)
            ("\\(/=\\)"                    #Xe12c)
            ("\\(/==\\)"                   #Xe12d)
            ("\\(/>\\)"                    #Xe12e)
            ("\\(//\\)"                    #Xe12f)
            ("\\(///\\)"                   #Xe130)
            ("\\(&&\\)"                    #Xe131)
            ("\\(||\\)"                    #Xe132)
            ("\\(||=\\)"                   #Xe133)
            ("[^|]\\(|=\\)"                #Xe134)
            ("\\(|>\\)"                    #Xe135)
            ("\\(\\^=\\)"                  #Xe136)
            ("\\(\\$>\\)"                  #Xe137)
            ("\\(\\+\\+\\)"                #Xe138)
            ("\\(\\+\\+\\+\\)"             #Xe139)
            ("\\(\\+>\\)"                  #Xe13a)
            ("\\(=:=\\)"                   #Xe13b)
            ("[^!/]\\(==\\)[^>]"           #Xe13c)
            ("\\(===\\)"                   #Xe13d)
            ("\\(==>\\)"                   #Xe13e)
            ("[^=]\\(=>\\)"                #Xe13f)
            ("\\(=>>\\)"                   #Xe140)
            ("\\(<=\\)"                    #Xe141)
            ("\\(=<<\\)"                   #Xe142)
            ("\\(=/=\\)"                   #Xe143)
            ("\\(>-\\)"                    #Xe144)
            ("\\(>=\\)"                    #Xe145)
            ("\\(>=>\\)"                   #Xe146)
            ("[^-=]\\(>>\\)"               #Xe147)
            ("\\(>>-\\)"                   #Xe148)
            ("\\(>>=\\)"                   #Xe149)
            ("\\(>>>\\)"                   #Xe14a)
            ("\\(<\\*\\)"                  #Xe14b)
            ("\\(<\\*>\\)"                 #Xe14c)
            ("\\(<|\\)"                    #Xe14d)
            ("\\(<|>\\)"                   #Xe14e)
            ("\\(<\\$\\)"                  #Xe14f)
            ("\\(<\\$>\\)"                 #Xe150)
            ("\\(<!--\\)"                  #Xe151)
            ("\\(<-\\)"                    #Xe152)
            ("\\(<--\\)"                   #Xe153)
            ("\\(<->\\)"                   #Xe154)
            ("\\(<\\+\\)"                  #Xe155)
            ("\\(<\\+>\\)"                 #Xe156)
            ("\\(<=\\)"                    #Xe157)
            ("\\(<==\\)"                   #Xe158)
            ("\\(<=>\\)"                   #Xe159)
            ("\\(<=<\\)"                   #Xe15a)
            ("\\(<>\\)"                    #Xe15b)
            ("[^-=]\\(<<\\)"               #Xe15c)
            ("\\(<<-\\)"                   #Xe15d)
            ("\\(<<=\\)"                   #Xe15e)
            ("\\(<<<\\)"                   #Xe15f)
            ("\\(<~\\)"                    #Xe160)
            ("\\(<~~\\)"                   #Xe161)
            ("\\(</\\)"                    #Xe162)
            ("\\(</>\\)"                   #Xe163)
            ("\\(~@\\)"                    #Xe164)
            ("\\(~-\\)"                    #Xe165)
            ("\\(~=\\)"                    #Xe166)
            ("\\(~>\\)"                    #Xe167)
            ("[^<]\\(~~\\)"                #Xe168)
            ("\\(~~>\\)"                   #Xe169)
            ("\\(%%\\)"                    #Xe16a)
           ;; ("\\(x\\)"                   #Xe16b) This ended up being hard to do properly so i'm leaving it out.
            ("[^:=]\\(:\\)[^:=]"           #Xe16c)
            ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
            ("[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f))))

(defun add-fira-code-symbol-keywords ()
  (font-lock-add-keywords nil fira-code-font-lock-keywords-alist))

;; (add-hook 'prog-mode-hook
;;           #'add-fira-code-symbol-keywords)

;; (use-package relative-line-numbers
;;   :ensure relative-line-numbers
;;   :init
;;   (defun abs-rel-numbers (offset)
;;     (if (= offset 0)
;;         (format "%4d " (line-number-at-pos))
;;       (format "%4d " (abs offset))))
;;   :config
;;   (progn
;;     (global-relative-line-numbers-mode)
;;     ))

(require 'relative-linum)
    (global-linum-mode t)
;; (use-package relative-linum
;;   :ensure relative-linum
;;   :config
;;   (progn
;;     (global-linum-mode t)
;;     ))

;; (setq relative-line-numbers-format #'abs-rel-numbers)

;; (use-package nlinum-relative
;;   :ensure nlinum-relative
;;   :config
;;   ;; something else you want
;;   ;; (nlinum-relative-setup-evil)
;;   (global-nlinum-relative-mode 1)
;;   ;; (add-hook 'prog-mode-hook 'nlinum-relative-mode)
;;   (setq nlinum-relative-redisplay-delay 0)      ;; delay
;;   )

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
    (setq counsel-git-grep-cmd "rg -j4 -i --no-heading --line-number -e %s .")
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

