:q;;; install-packages.el --- Emacs Package Installation

;; Author: Kyle W. Purdon (kpurdon)
;; Forked by: Josiah Olson (thenomemac)
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:

(require 'package)

(defvar my-packages
  '(better-defaults
    cyberpunk-theme
    material-theme
    monokai-theme
    elpy
    ein
    exec-path-from-shell
    flycheck
    js2-mode
    json-mode
    magit
    markdown-mode
    markdown-preview-mode
    osx-clipboard
    py-autopep8
    rainbow-delimiters
    smart-mode-line
    web-mode
    yaml-mode
    crosshairs))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))


(when (not package-archive-contents)
    (package-refresh-contents))
(package-initialize)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'install-packages)

;;; install-packages.el ends here
