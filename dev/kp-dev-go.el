;;; kp-dev-go --- golang configuration

;; http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/

;;; Code:

(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))

(setenv "GOPATH" "/Users/kpurdon/projects/gocode")

;; run gofmt on save
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "/Users/kpurdon/projects/gocode/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

(require 'go-mode)
;; (require 'go-autocomplete)

(provide 'kp-dev-go)

;;; kp-dev-go.el ends here
