;;; Code:
;; Core Miscellaneous config
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(when (executable-find "hunspell")
  (setq-default ispell-program-name "hunspell")
  (setq ispell-really-hunspell t))

(setq ispell-local-dictionary "en_US") ; "en_US" is key to lookup in `ispell-local-dictionary-alist`
(setq ispell-local-dictionary-alist
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil nil nil utf-8)))
;; Below line specify the ACTUAL dictionary we use
(setq ispell-extra-args '("-d en_US"))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(global-prettify-symbols-mode +1)
(setq compilation-scroll-output t)

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
(use-package relative-line-numbers
             :ensure relative-line-numbers
             :config
             (progn
               (global-relative-line-numbers-mode)
               ))

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

(provide 'init-core)
;;;
