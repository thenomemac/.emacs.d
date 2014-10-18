;;; kwp-misc --- misc configuration for kwp-emacs

;;; Code:

;; ----------------------------------------
;; set the default startup directory
(setq default-directory "~/Documents/projects/" )

;; ----------------------------------------
;; set the indent settings
(set-default `indent-tabs-mode nil)
(setq tab-width 4)

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
;; set the default startup directory
;; always use rainbow delims!
(add-to-list 'load-path "~/.emacs.d/externals/rainbow-delimiters/")
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

;; ----------------------------------------
;; set the default startup directory
;; no backup files (well, move them)
;;(setq make-backup-files nil) ;;
(setq backup-directory-alist `(("." . "~/.emacs_backups")))

(provide 'kwp-misc)

;;; kwp-misc.el ends here
