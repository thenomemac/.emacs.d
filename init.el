;; init -- emacs configuration

;; add configuration sub-directories
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; set the default (start) directory
(defvar emacs_home (getenv "EMACS_HOME"))
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
;; http://emacs.stackexchange.com/questions/10900/copy-text-from-emacs-to-os-x-clipboard
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; enable and configure smart-mode-line
(setq sml/no-confirm-load-theme t)
(sml/setup)
(add-to-list 'sml/replacer-regexp-list '("^/bitly/src/github.com/bitly/bitly" ":bitly:") t)

;; put all backup files in the system temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
