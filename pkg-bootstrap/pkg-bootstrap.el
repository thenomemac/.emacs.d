;; pkg-bootstrap.el - Bootstrap Emacs Package Installation

;; Author: Kyle W. Purdon (kpurdon)
;; URL: https://github.com/kpurdon/kp-emacs/bootstrap/pkg-bootstrap.el
;;
;; This file is not part of GNU Emacs.

;; Code:

(require 'package)

(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; always ensure packages defined with use-package are installed
(setq use-package-always-ensure t)

(provide 'pkg-bootstrap)

;; pkg-bootstrap.el ends here
