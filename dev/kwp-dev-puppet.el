;;; kwp-dev-puppet --- puppet configuration for kwp-emacs

;;; Code:

(add-hook 'puppet-mode-hook 'run-dev-hook)

(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(require 'puppet-mode)

(provide 'kwp-dev-puppet)

;;; kwp-dev-puppet.el ends here
