;;; kwp-dev-web --- web configuration for kwp-emacs

;;; Code:

(add-hook 'web-mode-hook 'run-dev-hook)
(auto-complete-mode nil)
(rainbow-delimiters-mode nil)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.less\\'" . web-mode))

(setq web-mode-markup-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-code-indent-offset 4)
(setq web-mode-indent-style 4)

(provide 'kwp-dev-web)

;;; kwp-dev-web.el ends here
