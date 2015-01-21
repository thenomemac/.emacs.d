;;; kwp-misc --- misc configuration for kwp-emacs

;;; Code:

;; ----------------------------------------
;; set the PATH variable (get it)
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

;; ----------------------------------------
;; set the default startup directory
(setq default-directory "~/Documents/projects/" )

;; ----------------------------------------
;; set the indent settings
(setq tab-width 2)

;; ----------------------------------------
;; column numbers
(require 'linum+)
(global-linum-mode t)

;; ----------------------------------------
;; set the feedbacks
(blink-cursor-mode 1)
(setq visible-bell 1)
(set-default 'indicate-empty-lines t)

;; ----------------------------------------
;; enable the clipboard
(setq x-select-enable-clipboard t)

;; ----------------------------------------
;; yes = y no = n
(defalias 'yes-or-no-p 'y-or-n-p)

;; ----------------------------------------
;; i'm on a mac yo!
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; ----------------------------------------
;; use aspell for flyspell (not ispell)
(setq-default ispell-program-name "/usr/local/bin/aspell")
(setq ispell-list-command "--list")
(add-hook 'text-mode-hook (lambda() (flyspell-mode 1)))

;; ----------------------------------------
;; move the backups
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(provide 'kwp-misc)

;;; kwp-misc.el ends here
