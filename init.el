;; init.el - Custom Emacs Configuration

;; Author: Kyle W. Purdon (kpurdon)
;; Version: 5.0.0
;; Keywords: configuration emacs
;; URL: https://github.com/kpurdon/kp-emacs/init.el
;;
;; This file is not part of GNU Emacs.

;; Code:

(package-initialize)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'pkg-bootstrap)

(use-package osx-copy-paste
  :ensure f
  :load-path "osx-copy-paste/")

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(use-package better-defaults
  :config
  ;; backups: use system tmp dir instead of user emacs dir
  (setq backup-directory-alist
        `((".*" . ,temporary-file-directory)))
  (setq auto-save-file-name-transforms
        `((".*" ,temporary-file-directory t))))

(setq inhibit-startup-message t)

(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

(windmove-default-keybindings)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(use-package cyberpunk-theme
             :config
             (load-theme 'cyberpunk t))

(use-package magit
             :bind ("C-c g" . magit-status)
             :config
             ;; disable auto-revert-mode (a bit faster w/o)
             (magit-auto-revert-mode 0)
             ;; display the magit in a full screen buffer
             (setq magit-display-buffer-function
                   'magit-display-buffer-fullframe-status-v1))

;; smart-mode-line replaces defined paths with shorthands
;; e.g ~/projects/gocode becomes :go:
(use-package smart-mode-line
             :init
             (setq sml/no-confirm-load-theme t)
             :config
             (sml/setup)
             (add-to-list 'sml/replacer-regexp-list '("^~/projects/gocode" ":go:") t))

(use-package yasnippet
             :config
             (yas-global-mode 1))

(use-package development
  :ensure f
  :load-path "development/")

;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
