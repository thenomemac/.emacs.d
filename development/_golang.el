;; _golang -- custom golang configuration

;; enable go-mode (go configuration for emacs)
(require 'go-mode)

;; enable rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook `go-mode-hook `rainbow-delimiters-mode)

;; define the bin directory for golang
(defvar GOBIN (concat (getenv "GOPATH") "/bin"))

;; always run gofmt on save
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path GOBIN)
(add-hook 'before-save-hook 'gofmt-before-save)

(provide '_golang)

;; _golang ends here
