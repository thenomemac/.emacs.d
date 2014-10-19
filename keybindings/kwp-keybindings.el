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
;; indent on RET
(define-key global-map (kbd "RET") 'newline-and-indent)

;; ----------------------------------------
;; autocorrect word with flyspell
(global-set-key (kbd "C-c a") 'flyspell-auto-correct-word)

;; ----------------------------------------
;; magit status
(global-set-key (kbd "C-c g") 'magit-status)

(provide 'kwp-keybindings)

;;; kwp-keybindings.el ends here
