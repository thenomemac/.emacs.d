;;; kwp-packages -- package installation for kwp-emacs

;;; Code:

(require 'package)

;;(add-to-list 'package-archives
;;	     '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives
;;	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(auto-complete
    autopair
    cyberpunk-theme
    flycheck
    flycheck-color-mode-line
    flyspell
    jedi
    magit
    powerline
    virtualenvwrapper)
)

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

(provide 'kwp-packages)

;;; kwp-packages.el ends here
