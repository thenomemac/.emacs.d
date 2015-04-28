;;; kp-dev-ruby --- ruby configuration

;;; Code:

(add-hook 'ruby-mode-hook 'run-dev-hook)

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Puppetfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Vagrantfile$" . ruby-mode))

(add-hook 'ruby-mode-hook '(lambda ()
                             (electric-pair-mode)
                             (flycheck-mode)))

(provide 'kp-dev-ruby)

;;; kp-dev-ruby.el ends here
