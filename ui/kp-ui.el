;;; kp-ui --- ui configuration

;;; Code:

(setq inhibit-startup-message t)

(load-theme `ample t)
(enable-theme `ample)

(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

(setq-default truncate-lines 1)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(set-default-font "Inconsolata 16")

(require 'neotree)

(provide 'kp-ui)

;;; kp-ui.el ends here
