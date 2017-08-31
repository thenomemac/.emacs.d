;;; init.el --- Custom Emacs Configuration

;; Author: Kyle W. Purdon (kpurdon)
;; Modified by: Josiah Olson (thenomemac)
;; Version: 6.0.0
;; Keywords: configuration emacs
;; URL: https://github.com/kpurdon/.emacs.d/init.el
;;
;; This file is not part of GNU Emacs.

;;; Commentary:

;;; Code:



;;; begin init

(package-initialize)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(require 'package)

;;; end init



;;; install-packages.el begins

(require 'package)

(defvar my-packages
  '(better-defaults
    cyberpunk-theme
    material-theme
    monokai-theme
    elpy
    ein
    exec-path-from-shell
    flycheck
    js2-mode
    json-mode
    magit
    markdown-mode
    markdown-preview-mode
    ;; osx-clipboard
    py-autopep8
    rainbow-delimiters
    smart-mode-line
    web-mode
    yaml-mode
    crosshairs
    url
    ;; ess
    ;; slime
    ;; ace-jump-mode
    avy
    key-chord
    multiple-cursors))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

(when (not package-archive-contents)
    (package-refresh-contents))
(package-initialize)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'install-packages)

;;; install-packages.el ends here



;;; theme and display

(setq inhibit-startup-message t
      linum-format "%4d \u2502 "
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      inhibit-startup-message t
      ;;mac-command-modifier 'meta
      ;;mac-option-modifier nil
      sml/no-confirm-load-theme t
      yas-global-mode 1
      url-using-proxy t
      ;;custom-file "~/.emacs.d/custom.el"
      magit-auto-revert-mode 0
      magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)

;; (osx-clipboard-mode +1)

(global-linum-mode t)

(load-theme 'monokai t)
(windmove-default-keybindings)
(defalias 'yes-or-no-p 'y-or-n-p)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;; end theme config



;;; _python.el -- custom python configuration

(elpy-enable)
(elpy-use-ipython)

;; depends
;; curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
;; bash Miniconda3-latest-Linux-x86_64.sh -b
;; echo -e '\n# Miniconda\nexport PATH="$HOME/miniconda3/bin:$PATH"' >> ~/.bashrc
;; conda install -y ipython jupyter numpy pandas scipy
;; pip install jedi rope flake8 importmagic autopep8 yapf

(setq elpy-rpc-backend "jedi")

(setq python-shell-interpreter "ipython"
    python-shell-interpreter-args "--simple-prompt --pprint")

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
;; ignoring:
;; - E501 - Try to make lines fit within --max-line-length characters.
;; - W293 - Remove trailing whitespace on blank line.xs
;; - W391 - Remove trailing blank lines.
;; - W690 - Fix various deprecated code (via lib2to3).
;; (require 'py-autopep8)
;; (setq py-autopep8-options '("--ignore=E501,W293,W391,W690"))
;; (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(define-key global-map (kbd "RET") 'newline-and-indent)

(provide '_python)

;;; _python.el ends here



;;; _javascript.el -- custom python configuration

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq js2-highlight-level 3)
(setq-default js2-basic-offset 4)

(provide '_javascript)

;;; _javascript.el ends here



;;; _json.el -- custom python configuration

(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(provide '_json)

;;; _json.el ends here



;;; _web.el -- custom python configuration

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

(provide '_web)

;;; _web.el ends here



;;; _markdown.el -- custom python configuration

(add-to-list 'auto-mode-alist '("\\.md$" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . gfm-mode))

(require 'markdown-preview-mode)

(provide '_markdown)

;;; _markdown.el ends here



;;; magit

(require 'magit)
(global-set-key (kbd "C-c g") 'magit-status)

(sml/setup)
(add-to-list 'sml/replacer-regexp-list
             '("^~/go" ":go:") t)

;;; end magit



;;; multiple-cursor

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;; end multiple-cursor



;;; avy config

(require 'avy)
(avy-setup-default)
;; (global-set-key (kbd "M-") 'avy-goto-char)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)

;;; end avy



;;; key-chord config

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "''"     'avy-goto-char)
(key-chord-define-global "f;"     'avy-goto-char)
(key-chord-define-global "fl"     'avy-goto-line)
(key-chord-define-global ",,"     'indent-for-comment)
(key-chord-define-global "f,"     'mc/mark-previous-like-this)
(key-chord-define-global "f."     'mc/mark-next-like-this)

;;; end key-chord


;;; xterm key decoding
;; As of this writing, emacs does not correctly recognize some xterm
;; key sequences.  Add code to deal with these.
(defun add-escape-key-mapping-alist (escape-prefix key-prefix
                                                   suffix-alist)
  "Add mappings for up, down, left and right keys for a given list
of escape sequences and list of keys."
  (while suffix-alist
    (let ((escape-suffix (car (car suffix-alist)))
          (key-suffix (cdr (car suffix-alist))))
      (define-key input-decode-map (concat escape-prefix escape-suffix)
        (read-kbd-macro (concat key-prefix key-suffix))))
    (setq suffix-alist (cdr suffix-alist))))

(defun my-setup-input-decode-map ()
  (setq nav-key-pair-alist
        '(("A" . "<up>") ("B" . "<down>") ("C" . "<right>") ("D" . "<left>")
          ("H" . "<home>") ("F" . "<end>")))

  (add-escape-key-mapping-alist "\e[1;2" "S-" nav-key-pair-alist)
  (add-escape-key-mapping-alist "\e[1;3" "M-" nav-key-pair-alist)
  (add-escape-key-mapping-alist "\e[1;4" "M-S-" nav-key-pair-alist)
  (add-escape-key-mapping-alist "\e[1;6" "C-S-" nav-key-pair-alist)
  (add-escape-key-mapping-alist "\e[1;7" "M-C-" nav-key-pair-alist)
  (add-escape-key-mapping-alist "\e[1;8" "M-C-S-" nav-key-pair-alist))



;;; Misc packages

;; (require 'install-packages)

(require 'better-defaults)

;;; end misc packages



;;; custom functions

(defun pbcopy ()
  (interactive)
  (let ((deactivate-mark t))
    (call-process-region (point) (mark) "pbcopy")))

(defun pbpaste ()
  (interactive)
  (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

(defun pbcut ()
  (interactive)
  (pbcopy)
  (delete-region (region-beginning) (region-end)))

(defun xcopy ()
  (interactive)
  (call-process-region (point) (mark) "xclip -selection clipboard")
  (setq deactivate-mark t))

;;; end custom functions



;;; scratch

;; slime
;;(setq inferior-lisp-program "sbcl")
;;(setq slime-contribs '(slime-fancy))

;;(load custom-file)

;;(defvar emacs_home (getenv "EMACS_HOME"))
;;(setq default-directory emacs_home)

;;; init.el ends here
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (multiple-cursors yaml-mode web-mode smart-mode-line rainbow-delimiters py-autopep8 osx-clipboard monokai-theme material-theme markdown-preview-mode magit json-mode js2-mode flycheck exec-path-from-shell elpy ein cyberpunk-theme crosshairs better-defaults))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
;; (put 'narrow-to-region 'disabled nil)
;; (custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;; '(package-selected-packages
;;   (quote
;;    (multiple-cursors avy yaml-mode web-mode smart-mode-line rainbow-delimiters markdown-preview-mode markdown-mode magit json-mode flycheck ein elpy monokai-theme better-defaults))))
;; (custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;;  )
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (py-autopep8 exec-path-from-shell yaml-mode web-mode smart-mode-line rainbow-delimiters multiple-cursors monokai-theme markdown-preview-mode magit json-mode flycheck elpy ein better-defaults avy))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
