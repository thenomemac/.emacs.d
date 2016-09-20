;; development.el - Load All Development Configuration

;; Author: Kyle W. Purdon (kpurdon)
;; URL: https://github.com/kpurdon/kp-emacs/development/development.el
;;
;; This file is not part of GNU Emacs.

;; Code:

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package flycheck)

(use-package _golang
  :ensure f)

(use-package _python
  :ensure f)

(provide 'development)

;; development.el ends here
