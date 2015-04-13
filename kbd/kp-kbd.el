;;; kp-kbd --- keybindings

;;; Code:

(windmove-default-keybindings)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(global-set-key (kbd "C-c g") 'magit-status)

(global-set-key (kbd "C-c n") 'neotree-toggle)

;; (global-set-key (kbd "M-n") (lambda () (interactive) (next-line 5)))
;; (global-set-key (kbd "M-p") (lambda () (interactive) (previous-line 5)))

(provide 'kp-kbd)

;;; kp-kbd.el ends here
