;;; kwp-dev-nginx --- nginx configuration for kwp-emacs

;;; Code:

(add-hook 'nginx-mode-hook 'run-dev-hook)

(require 'nginx-mode)

(provide 'kwp-dev-nginx)

;;; kwp-dev-nginx.el ends here
