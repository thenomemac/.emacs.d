;;; kp-dev-python --- python configuation

;;; Code:

(elpy-enable)

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
