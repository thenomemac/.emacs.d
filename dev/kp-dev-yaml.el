;;; kp-dev-yaml --- yaml configuration

;;; Code:

(require 'yaml-mode)

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(provide 'kp-dev-yaml)

;;; kp-dev-yaml.el ends here
