;; keybindings -- set custom keybindings

;; allow shit+arrow key window movement
(windmove-default-keybindings)

(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c g") 'magit-status)

(provide 'keybindings)

;; keybindings end here
