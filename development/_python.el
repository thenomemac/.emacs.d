;; _python.el -- custom python configuration

;; Author: Kyle W. Purdon (kpurdon)
;; URL: https://github.com/kpurdon/kp-emacs/development/_python.el
;;
;; This file is not part of GNU Emacs.

;; Code:

(use-package elpy
  :init (with-eval-after-load 'python (elpy-enable))
  :config
  ;; use flycheck instead of flymake
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)

  ;; enable autopep8 on save
  ;; Ignoring:
  ;;  - E501: line too long
  ;;  - W293: trailing whitespace
  ;;  - W391: blank line at EOF
  ;;  - W690: fix deprecated code
  (use-package py-autopep8
    :config
    (setq py-autopep8-options '("--ignore=E501,W293,W391,W690"))
    (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

  :bind ("RET" . newline-and-indent))

(provide '_python)

;; _python.el ends here
