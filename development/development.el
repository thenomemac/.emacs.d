;; development.el - Load All Development Configuration

;; Author: Kyle W. Purdon (kpurdon)
;;
;; This file is not part of GNU Emacs.

;; Code:

(require 'rainbow-delimiters)

(global-flycheck-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'subword-mode)

(require '_python)
(require '_markdown)
(require '_javascript)
(require '_web)
(require '_json)

(provide 'development)

;; development.el ends here
