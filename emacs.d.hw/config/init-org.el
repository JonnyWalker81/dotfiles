;;; Code:

;; (setq org-latex-to-pdf-process '("/usr/local/texlive/2015basic/bin/universal-darwin/pdftex %f"))
(use-package org-bullets
  :ensure org-bullets
  :config
  (progn

    ))

(add-hook 'org-mode-hook (lambda()
			   (auto-fill-mode 1)
			   (flyspell-mode 1)
			   (org-bullets-mode t)
			   ))

(use-package ox-twbs
  :ensure ox-twbs
  :config
  (progn

    ))

(use-package org-page
  :ensure org-page
  :config
  (progn

    (setq op/repository-directory "~/Repositories/JonnyWalker81.github.io")
    (setq op/site-domain "http://JonnyWalker81.github.io")
    (setq op/personal-github-link "https://github.com/JonnyWalker81")
    (setq op/site-main-title "Blog")
    (setq op/site-sub-title "Random Adventures in Coding")
    ;; (setq op/personal-disqus-shortname "theonetrueblog")
    ))

(setq org-hide-leading-stars t)
(setq org-ellipsis "⤵")
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-html-checkbox-type 'html)

(defun open-todo-list ()
  (interactive)
  (find-file "~/Dropbox/Notes/Org/Todo.org"))


;; Point to plantuml.jar, for example:
(setq org-plantuml-jar-path "~/Downloads/plantuml.jar")

;; Enable evaluation of PlantUML code blocks with C-c C-c
(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t)
   ;; ... add more above this line when needed ...
   ))


(setq org-log-done 'time)
(setq org-agenda-files '("~/Dropbox/Notes/Org"))

;; Disable confirmation question when evaluating (C-c C-c) these languages
(defun my-org-confirm-babel-evaluate (lang body)
  (not (or (string= lang "plantuml")
           ;; ... add more above this line when needed ...
           )))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;; Make PlantUML code blocks editable in fundamental mode with C-c '
;; (There are probably better options than fundamental, but it gets the job done)
(add-to-list 'org-src-lang-modes '("plantuml" . fundamental))

;; Display the generated image after evaluating the code block
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)

;; Sensible header default arguments for PlantUML
(setq org-babel-default-header-args:PlantUML
      '((:results . "file") (:exports . "results") (:noweb . "yes") (:cmdline . "-charset UTF-8")))

(setq org-directory "~/Dropbox/Notes/Org")

(setq org-capture-templates
      '(("a" "My TODO task format." entry
         (file "Todo.org")
         "** TODO %?
SCHEDULED: %t")))

(provide 'init-org)
;;;
