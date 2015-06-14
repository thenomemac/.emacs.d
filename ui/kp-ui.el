;;; kp-ui --- ui configuration

;;; Code:

(setq inhibit-startup-message t)

(load-theme `material t)

(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

(set-default-font "Inconsolata 16")

(require 'neotree)

(provide 'kp-ui)

;;; kp-ui.el ends here
