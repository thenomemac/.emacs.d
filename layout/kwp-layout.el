;;; kwp-layout --- layout configuration for kwp-emacs

;;; Code:

;; ----------------------------------------
;; set the theme
(require 'cyberpunk-theme)

;; ----------------------------------------
;; set the default font
(set-default-font "Inconsolas 16")

;; ----------------------------------------
;; kill off the startup message
(setq inhibit-startup-message t)

;; ----------------------------------------
;; turn most of the window stuff off
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; ----------------------------------------
;; use powerline, cause it's nice
(require 'powerline)
(powerline-default-theme)

;; ----------------------------------------
;; format the frame title
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

;; ----------------------------------------
;; start the window full-screen
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(provide 'kwp-layout)

;;; kwp-layout.el ends here
