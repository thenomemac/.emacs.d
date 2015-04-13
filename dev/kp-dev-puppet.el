;;; kp-dev-puppet --- puppet configuration

;;; Code:

(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(require 'puppet-mode)

(add-hook 'puppet-mode-hook '(lambda ()
                               (electric-pair-mode)
                               (flycheck-mode)))

(provide 'kp-dev-puppet)

;;; kwp-dev-puppet.el ends here
