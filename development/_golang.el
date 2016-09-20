;; _golang.el -- custom golang configuration

;; Author: Kyle W. Purdon (kpurdon)
;; URL: https://github.com/kpurdon/kp-emacs/development/_golang.el
;;
;; This file is not part of GNU Emacs.

;; Code:

(use-package go-mode
  :config
  (exec-path-from-shell-copy-env "GOPATH")

  (use-package auto-complete
    :config
    (use-package go-autocomplete)
    (ac-config-default))

  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)

  (add-hook `go-mode-hook `flycheck-mode)

  (use-package go-guru
    :config
    (add-hook `go-mode-hook `go-guru-hl-identifier-mode)
    (set-face-attribute 'highlight nil :background "#FF0" :foreground "#000"))

  (use-package go-add-tags
    :bind (("C-c t" . go-add-tags)))

  (use-package go-eldoc
    :config
    (add-hook 'go-mode-hook 'go-eldoc-setup)))



(provide '_golang)

;; _golang.el ends here
