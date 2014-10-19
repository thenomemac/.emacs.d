;;; kwp-dev-yaml --- yaml configuration for kwp-emacs

;;; Code:

(add-hook 'yaml-mode-hook 'run-dev-hook)

(require 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(provide 'kwp-dev-yaml)

;;; kwp-dev-yaml.el ends here
