;;; kwp-dev-javascript --- javascript configuration for kwp-emacs

;;; Code:

(add-hook 'js2-mode-hook 'run-dev-hook)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(autoload 'tern-mode "tern.el" nil t)

(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(setq-default js2-basic-offset 2)
(setq js2-highlight-level 3)

(provide 'kwp-dev-javascript)

;;; kwp-dev-javascript.el ends here
