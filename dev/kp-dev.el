;;; kp-dev --- development configuration

;;; Code:

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'kp-dev-python)
(require 'kp-dev-puppet)

(provide 'kp-dev)

;;; kp-dev.el ends here
