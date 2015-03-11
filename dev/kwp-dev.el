;;; kwp-dev --- development configuration for kwp-emacs

;;; Code:

(defun local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(require 'auto-complete)
(defun add-auto-complete ()
  (auto-complete-mode 1))

(defun add-rainbow-delims ()
  (rainbow-delimiters-mode 1))

(defun dev-before-save-hook ()
  (add-hook 'before-save-hook 'delete-trailing-whitespace))

(defvar dev-hook nil
  "Hook that gets run on activation of any programming mode.")
(add-hook 'dev-hook 'local-comment-auto-fill)
;; (add-hook 'dev-hook 'add-auto-complete)
(add-hook 'dev-hook 'dev-before-save-hook)
(add-hook 'dev-hook 'add-rainbow-delims)

(defun run-dev-hook ()
  "Enable things that are convenient across all dev buffers."
  (interactive)
  (run-hooks 'dev-hook))

;; ----------------------------------------
;; load all of the kwp-dev-* configurations
(require 'kwp-dev-python)
(require 'kwp-dev-markdown)
(require 'kwp-dev-puppet)
(require 'kwp-dev-javascript)
(require 'kwp-dev-ruby)
(require 'kwp-dev-terminal)
(require 'kwp-dev-web)
(require 'kwp-dev-yaml)
(require 'kwp-dev-mapserver)
(require 'kwp-dev-nginx)
(require 'kwp-dev-docker)
(require 'kwp-dev-jade)

(provide 'kwp-dev)

;;; kwp-dev.el ends here
