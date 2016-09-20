;; osx-copy-paste.el - Copy-Paste Support For OSX

;; Author: Kyle W. Purdon (kpurdon)
;; URL: https://github.com/kpurdon/kp-emacs/osx-copy-paste/osx-copy-paste.el
;;
;; This file is not part of GNU Emacs.

;; Code:

;; http://emacs.stackexchange.com/questions/10900/copy-text-from-emacs-to-os-x-clipboard
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(provide 'osx-copy-paste)

;; osx-copy-paste.el ends here
