;; packages - load emacs packages

(require 'package)

;; add the melpa package repo
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar _packages
  '(better-defaults
    cyberpunk-theme
    elpy
    exec-path-from-shell
    flycheck
    go-autocomplete
    go-mode
    js2-mode
    json-mode
    magit
    markdown-mode
    nginx-mode
    py-autopep8
    rainbow-delimiters
    smart-mode-line
    web-mode
    yaml-mode))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      _packages)

(provide 'packages)

;; packages.el ends here
