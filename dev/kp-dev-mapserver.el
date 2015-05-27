;;; kp-dev-mapserver --- mapserver configuration

;;; Code:

(add-to-list 'auto-mode-alist '("\\.map\\'" . mapserver-mode))
(add-to-list 'auto-mode-alist '("\\.lay\\'" . mapserver-mode))
(add-to-list 'auto-mode-alist '("\\.sym\\'" . mapserver-mode))

(require `mapserver-mode)

(provide 'kp-dev-mapserver)

;;; kp-dev-mapserver.el ends here
