;;; kwp-dev-jade --- jade configuration for kwp-emacs

;;; Code:

(add-hook 'yaml-mode-hook 'run-dev-hook)

(require 'sws-mode)
(require 'jade-mode)

(add-to-list 'auto-mode-alist '("\\.stl$" . styl-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

(provide 'kwp-dev-jade)

;;; kwp-dev-jade.el ends here
