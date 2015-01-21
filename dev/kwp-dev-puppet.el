;;; kwp-dev-puppet --- puppet configuration for kwp-emacs

;;; Code:

(add-hook 'puppet-mode-hook 'run-dev-hook)

(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(add-to-list 'auto-mode-alist '("\\Puppetfile$" . puppet-mode))

(require 'puppet-mode)

;; ----------------------------------------
;; add hooks for puppet mode startup
(add-hook 'puppet-mode-hook '(lambda ()
			       (autopair-mode)
			       (flycheck-mode)))

(provide 'kwp-dev-puppet)

;;; kwp-dev-puppet.el ends here
