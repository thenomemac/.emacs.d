;;; kwp-packages -- package installation for kwp-emacs

;;; Code:

(require 'package)

(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives
;;	     '("marmalade" . "http://marmalade-repo.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(cyberpunk-theme
    flyspell
    magit
    powerline)
)

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)

(provide 'kwp-packages)

;;; kwp-packages.el ends here
