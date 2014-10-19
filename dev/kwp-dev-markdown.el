;;; kwp-dev-markdown --- markdown configuration for kwp-emacs

;;; Code:

(add-hook 'markdown-mode-hook 'run-dev-hook)

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.mdown$" . markdown-mode))

(add-hook 'markdown-mode-hook
          (lambda ()
            (visual-line-mode t)
            (flyspell-mode t)))

(provide 'kwp-dev-markdown)

;;; kwp-dev-markdown.el ends here
