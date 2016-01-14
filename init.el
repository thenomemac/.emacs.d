;; init -- emacs configuration

;; add configuration sub-directories
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; set the default (start) directory
(if (string= "" (getenv "EMACS_HOME"))
    (defvar emacs_home (getenv "EMACS_HOME")) (defvar emacs_home "~/"))
(setq default-directory emacs_home)

;; load all other configuration
(require 'packages)
(require 'keybindings)
(require 'development)

;; enable the cyberpunk theme
(load-theme 'cyberpunk t)

;; disable the default startup message
(setq inhibit-startup-message t)

;; enable global line numbers
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

;; simplify prompts (only yes or no)
(defalias 'yes-or-no-p 'y-or-n-p)

;; enable system clipboard
(require 'pbcopy)
(turn-on-pbcopy)
