;;; kwp-packages -- package installation for kwp-emacs

;;; Code:

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
;;(add-to-list 'package-archives
;;	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(auto-complete
    autopair
    cyberpunk-theme
    exec-path-from-shell
    flycheck
    flycheck-color-mode-line
    flyspell
    inf-ruby
    jedi
    js2-mode
    js2-refactor
    magit
    markdown-mode
    powerline
    robe
    web-mode
    virtualenvwrapper
    yaml-mode)
)

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

(provide 'kwp-packages)

;;; kwp-packages.el ends here
