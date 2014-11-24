;;; kwp-layout --- layout configuration for kwp-emacs

;;; Code:

;; ----------------------------------------
;; set the theme
(require 'cyberpunk-theme)

;; ----------------------------------------
;; remove the background color in the terminal
(defun set-bg ()

  ;; set the defaults
  (set-face-attribute 'default nil :background "grey12")
  (set-face-attribute 'fringe nil :background "grey12")
  (set-face-attribute 'linum nil :background "grey12" :foreground "brightblack")

  ;;; override the defaults for terminal user
  (unless (display-graphic-p (selected-frame))
    ;;(set-face-background 'default "unspecified-bg" (selected-frame))
    (set-face-attribute 'default nil :background "unspecified-bg")
    (set-face-attribute 'fringe nil :background "unspecified-bg")
    (set-face-attribute 'linum nil :background "unspecified-bg" :foreground "brightblack")
    ))

(add-hook 'window-setup-hook 'set-bg)

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
