;; _javascript.el -- custom python configuration

;; Author: Kyle W. Purdon (kpurdon)
;; URL: https://github.com/kpurdon/kp-emacs/development/_javascript.el
;;
;; This file is not part of GNU Emacs.

;; Code:

(use-package js2-mode
  :mode "\\.js\\"
  :config
  (setq js2-highlight-level 3)
  (setq-default js2-basic-offset 4))

(provide '_javascript)

;; _javascript.el ends here
