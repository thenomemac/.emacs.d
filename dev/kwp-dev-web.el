;;; kwp-dev-web --- web configuration for kwp-emacs

;;; Code:

(add-hook 'web-mode-hook 'run-dev-hook)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(provide 'kwp-dev-web)

;;; kwp-dev-web.el ends here
