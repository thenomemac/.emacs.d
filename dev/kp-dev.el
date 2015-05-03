;;; kp-dev --- development configuration

;;; Code:

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'kp-dev-python)
(require 'kp-dev-puppet)
(require 'kp-dev-markdown)
(require 'kp-dev-yaml)
(require 'kp-dev-web)
(require 'kp-dev-sass)
(require 'kp-dev-docker)
(require 'kp-dev-ruby)
(require 'kp-dev-jekyll)

(provide 'kp-dev)

;;; kp-dev.el ends here
