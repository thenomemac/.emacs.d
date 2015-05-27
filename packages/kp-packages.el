;;; kp-packages -- package installation

;;; Code:

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(ample-theme
    better-defaults
    dockerfile-mode
    ein
    elpy
    flycheck
    flycheck-color-mode-line
    go-mode
    company-go
    jekyll-modes
    magit
    markdown-mode
    neotree
    pbcopy
    puppet-mode
    py-autopep8
    sass-mode
    web-mode
    yaml-mode))


(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

(provide 'kp-packages)

;;; kwp-packages.el ends here
