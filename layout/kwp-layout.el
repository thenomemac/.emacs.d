;;; kwp-layout --- layout configuration for kwp-emacs

;;; Code:

;; ----------------------------------------
;; set the theme
(require 'cyberpunk-theme)

;; ----------------------------------------
;; remove the background color in the terminal
(defun set-bg ()

  ;; set the defaults
  (set-face-attribute 'default nil :background "#262626")
  (set-face-attribute 'fringe nil :background "brightblack")
  (set-face-attribute 'linum nil :background "#262626" :foreground "brightblack")

  )

(add-hook 'window-setup-hook 'set-bg)

;; ----------------------------------------
;; set the default cell color for IPython
(custom-set-faces
 '(ein:cell-input-area ((t (:background "black")))))

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
;; currently disable because i could find a workaround for a warning
;; (require 'powerline)
;; (powerline-default-theme)

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
