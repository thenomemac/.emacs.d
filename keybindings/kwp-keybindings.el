;;; kwp-keybindings --- keybindings for kwp-emacs

;;; Code:

;; ----------------------------------------
;; shit + [arrows] to move across windows
(windmove-default-keybindings)

;; ----------------------------------------
;; increase/decrease text size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; ----------------------------------------
;; use ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; ----------------------------------------
;; indent-region
;; (global-set-key (kbd "C-i") 'indent-region)

;; ----------------------------------------
;; autocorrect word with flyspell
(global-set-key (kbd "C-c a") 'flyspell-auto-correct-word)

;; ----------------------------------------
;; magit status
(global-set-key (kbd "C-c g") 'magit-status)

;; ----------------------------------------
;; 5 line jump previous next
(global-set-key (kbd "M-n") (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "M-p") (lambda () (interactive) (previous-line 5)))


(provide 'kwp-keybindings)

;;; kwp-keybindings.el ends here
