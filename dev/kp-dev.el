;;; kp-dev --- development configuration

;;; Code:

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'kp-dev-python)
(require 'kp-dev-puppet)
(require 'kp-dev-markdown)
(require 'kp-dev-yaml)
(require 'kp-dev-sass)

(provide 'kp-dev)

;;; kp-dev.el ends here
