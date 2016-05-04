;;; Code:

(setq org-latex-to-pdf-process '("texi2dvi --pdf --clean --verbose --batch %f"))

(add-hook 'org-mode-hook (lambda()
			   (auto-fill-mode 1)
			   (flyspell-mode 1)))

;; Point to plantuml.jar, for example:
(setq org-plantuml-jar-path "~/Downloads/plantuml.jar")

;; Enable evaluation of PlantUML code blocks with C-c C-c
(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t)
   ;; ... add more above this line when needed ...
   ))

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

(provide 'init-org)
;;;
