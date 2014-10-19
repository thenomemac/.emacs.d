;;; kwp-dev-terminal --- terminal configuration for kwp-emacs

;;; Code:

(setq multi-term-program "/bin/bash")
(exec-path-from-shell-initialize)
(add-hook 'term-mode-hook 'ansi-color-for-comint-mode-on)

(provide 'kwp-dev-terminal)

;;; kwp-dev-terminal.el ends here
