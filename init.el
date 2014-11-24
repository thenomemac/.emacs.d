;;; init --- kpurdon emacs config file
;;; Commentary:

;; Like most I was "recruited" into the Emacs world and 
;; given a few hand-me-down configs to start off my new
;; Emacs adventure.
;;
;; Kevin Beam: https://gitorious.org/kwbeam/kwb-emacs/
;; Matt Savoie: https://github.com/flamingbear/emacs-config
;;
;; This configuration is a mashup of the two above, plus
;; lots of internet Emacs wizardry and my own inputs!

;;; Code:

;; --------------------------------------------------
;; add all subdirectories to path

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;; --------------------------------------------------
;; load all of the kwp-* configurations
(require 'kwp-packages)
(require 'kwp-layout)
(require 'kwp-misc)
(require 'kwp-keybindings)
(require 'kwp-dev)


;; --------------------------------------------------
;; copy tools
(if (eq system-type 'darwin)
    ;; use pbcopy for macosx
    (require 'pbcopy)
)

;; --------------------------------------------------
;; start page
(find-file "~/.emacs.d/misc/start.txt")

;;; init.el ends here
