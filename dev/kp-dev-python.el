;;; kp-dev-python --- python configuation

;;; Code:

(elpy-enable)

(require 'py-autopep8)
(setq py-autopep8-options '("--max-line-length=100"))
(add-hook 'before-save-hook 'py-autopep8-enable-on-save)

;; use flycheck not flymake
(when (require 'flycheck nil t)
  (setq elpy-modules
        (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; indent on RET
(add-hook 'python-mode-hook
          '(lambda ()
             (define-key global-map (kbd "RET")
               'newline-and-indent)))

(provide 'kp-dev-python)

;;; kp-dev-python.el ends here
