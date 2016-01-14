;; development -- load development modes

;; delete trailing white space always
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require '_python)
(require '_golang)
(require '_markdown)
(require '_javascript)
(require '_web)

(provide 'development)

;; development ends here
