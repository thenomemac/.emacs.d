;;; init --- configuration initialization
;;; Commentary:

;; Thanks to Kevin Beam and Matt Savoie for stagting me
;; on my emacs journey. Without there encouragment,
;; hand-me-down configurations and help along the way
;; I would not be a part of the wonderful emacs community!
;;
;; Kevin Beam:  https://github.com/kwbeam/kwb-emacs
;; Matt Savoie: https://github.com/flamingbear/emacs-config
;;
;; This configuration has grown from the two above.

;;; Code:

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(setq default-directory "~/projects/" )

(require 'kp-packages)
(require 'kp-ui)
(require 'kp-kbd)
(require 'kp-dev)

(setq magit-last-seen-setup-instructions "1.4.0")

;;; init.el ends here
