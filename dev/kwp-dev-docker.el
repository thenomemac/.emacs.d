;;; kwp-dev-docker --- docker configuration for kwp-emacs

;;; Code:

(add-hook 'docker-mode-hook 'run-dev-hook)

(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))


(require 'dockerfile-mode)

;; ----------------------------------------
;; add hooks for puppet mode startup
(add-hook 'docker-mode-hook '(lambda ()
			       (autopair-mode)
			       (flycheck-mode)))

(provide 'kwp-dev-docker)

;;; kwp-dev-docker.el ends here
