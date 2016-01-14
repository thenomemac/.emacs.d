;; _markdown -- markdown configuration

;; use gfm (github flavored markdown) supplied by markdown-mode
(add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . gfm-mode))

(provide '_markdown)

;; _markdown ends here
