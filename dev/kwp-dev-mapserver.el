;;; kwp-dev-mapserver --- mapserver configuration for kwp-emacs

;;; Code:

(add-hook 'mapserver-mode-hook 'run-dev-hook)

(add-to-list 'auto-mode-alist '("\\.map$" . mapserver-mode))

(require 'mapserver-mode)

(provide 'kwp-dev-mapserver)

;;; kwp-dev-mapserver.el ends here
