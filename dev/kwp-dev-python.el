;;; kwp-dev-python --- python configuation for kwp-emacs

;;; Code:

(add-hook 'python-mode-hook 'run-dev-hook)

;; ----------------------------------------
;; use elpy mode
(elpy-enable)

;; ----------------------------------------
;; use flycheck in elpy mode (not flymake)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; ----------------------------------------
;; indent on RET
(add-hook 'python-mode-hook '(lambda ()
			       (define-key global-map (kbd "RET") 'newline-and-indent)))

;; ----------------------------------------
;; add hooks for python mode startup
(add-hook 'python-mode-hook '(lambda ()
			       (autopair-mode)))

(provide 'kwp-dev-python)

;;; kwp-dev-python.el ends here
