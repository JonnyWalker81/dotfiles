;;; doom-themes-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "doom-molokai-theme" "doom-molokai-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from doom-molokai-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-molokai-theme" '("doom-molokai")))

;;;***

;;;### (autoloads nil "doom-nova-theme" "doom-nova-theme.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from doom-nova-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-nova-theme" '("doom-nova")))

;;;***

;;;### (autoloads nil "doom-one-theme" "doom-one-theme.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from doom-one-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-one-theme" '("doom-one")))

;;;***

;;;### (autoloads nil "doom-themes" "doom-themes.el" (0 0 0 0))
;;; Generated autoloads from doom-themes.el

(autoload 'doom-color "doom-themes" "\
Retrieve a specific color named NAME (a symbol) from the current theme.

\(fn NAME &optional TYPE)" nil nil)

(autoload 'doom-ref "doom-themes" "\
TODO

\(fn FACE PROP &optional CLASS)" nil nil)

(autoload 'doom-themes-neotree-config "doom-themes" "\
Install doom-themes' neotree configuration.

Includes an Atom-esque icon theme and highlighting based on filetype.

\(fn)" nil nil)

(autoload 'doom-themes-visual-bell-config "doom-themes" "\
Enable flashing the mode-line on error.

\(fn)" nil nil)

(autoload 'doom-themes-visual-bell-fn "doom-themes" "\
Blink the mode-line red briefly. Set `ring-bell-function' to this to use it.

\(fn)" nil nil)

(when (and (boundp 'custom-theme-load-path) load-file-name) (let* ((base (file-name-directory load-file-name)) (dir (expand-file-name "themes/" base))) (add-to-list 'custom-theme-load-path (or (and (file-directory-p dir) dir) base))))

(autoload 'doom-brighten-minibuffer "doom-themes" "\
Does nothing. `doom-brighten-minibuffer' has been moved to the `solaire-mode'
package as `solaire-mode-in-minibuffer'. This function is deprecated.

\(fn)" nil nil)

(autoload 'doom-buffer-mode "doom-themes" "\
Does nothing. `doom-buffer-mode' has been moved to the `solaire-mode'
package. This function is deprecated.

\(fn &optional ARG)" t nil)

(autoload 'doom-buffer-mode-maybe "doom-themes" "\
Does nothing. `doom-buffer-mode' has been moved to the `solaire-mode'
package. This function is deprecated.

\(fn)" nil nil)

(autoload 'doom-themes-nlinum-config "doom-themes" "\
Does nothing. This functionality has been moved to the `nlinum-hl' package.
This function is deprecated.

\(fn)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-themes" '("doom-" "def-doom-theme")))

;;;***

;;;### (autoloads nil "doom-themes-common" "doom-themes-common.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from doom-themes-common.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-themes-common" '("doom-")))

;;;***

;;;### (autoloads nil "doom-themes-neotree" "doom-themes-neotree.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from doom-themes-neotree.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-themes-neotree" '("doom-")))

;;;***

;;;### (autoloads nil "doom-tomorrow-night-theme" "doom-tomorrow-night-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from doom-tomorrow-night-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-tomorrow-night-theme" '("doom-tomorrow-night")))

;;;***

;;;### (autoloads nil "doom-vibrant-theme" "doom-vibrant-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from doom-vibrant-theme.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doom-vibrant-theme" '("doom-vibrant")))

;;;***

;;;### (autoloads nil nil ("doom-themes-nlinum.el" "doom-themes-pkg.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; doom-themes-autoloads.el ends here
