;;; Code:

(use-package helm
  :ensure helm
  :config
  
  (evil-leader/set-key
    "b" 'helm-mini
    "s" 'helm-do-ag-project-root
    "ff" 'helm-find-files)

  (progn

    (use-package helm-projectile
      :ensure helm-projectile
      :config
      (progn))

    (setq helm-grep-ag-command "rg --smart-case --no-heading --line-number %s %s %s")
    (use-package helm-swoop
        :ensure helm-swoop
        ;; :bind (("M-i" . helm-swoop
        ;;         ("M-I" . helm-swoop-back-to-last-point)
        ;;         ("C-c M-i" . helm-multi-swoop)))
        :config
        ;; When doing isearch, hand the word over to helm-swoop
        (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
        ;; From helm-swoop to helm-multi-swoop-all
        (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
        ;; Save buffer when helm-multi-swoop-edit complete
        (setq helm-multi-swoop-edit-save t
                ;; If this value is t, split window inside the current window
                helm-swoop-split-with-multiple-windows t
                ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
                helm-swoop-split-direction 'split-window-vertically
                ;; If nil, you can slightly boost invoke speed in exchange for text color
                helm-swoop-speed-or-color nil))

    (use-package helm-ag
      :ensure helm-ag
      :config
      (progn
        (setq helm-ag-insert-at-point nil)
        (setq helm-ag-base-command "rg --smart-case --no-heading --line-number --vimgrep")))))

        

        

(provide 'init-helm)
;;;
