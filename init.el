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
    go-mode
    go-guru
    auto-complete
    go-autocomplete
    flymake-go
    company
    company-go
    go-add-tags
    go-eldoc
    neotree
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
;; conda install -y numpy pandas scipy matplotlib mkl ipython jupyter requests flask bokeh tqdm pytest
;; pip install jupyter-emacskeys
;; pip install jedi rope flake8 importmagic autopep8 yapf
;; mkdir -p ~/.config; echo -e '[flake8]\nmax-line-length = 120' >> ~/.config/flake8

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
(require 'py-autopep8)
(setq py-autopep8-options '("--ignore=E501,W690"))
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

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



;;; golang

;; go dependencies
;; go get -u golang.org/x/tools/cmd/...
;; go get -u github.com/rogpeppe/godef/...
;; go get -u github.com/nsf/gocode
;; go get -u golang.org/x/tools/cmd/goimports
;; go get -u golang.org/x/tools/cmd/guru
;; go get -u github.com/dougm/goflymake

;; Snag the user's PATH and GOPATH
;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize)
;;   (exec-path-from-shell-copy-env "GOPATH"))
;; 
;; ;; Define function to call when go-mode loads
;; (defun my-go-mode-hook ()
;;   (add-hook 'before-save-hook 'gofmt-before-save) ; gofmt before every save
;;   (setq gofmt-command "goimports")                ; gofmt uses invokes goimports
;;   (if (not (string-match "go" compile-command))   ; set compile command default
;;       (set (make-local-variable 'compile-command)
;;            "go build -v && go test -v && go vet"))
;; 
;;   ;; guru settings
;;   (go-guru-hl-identifier-mode)                    ; highlight identifiers
;;   
;;   ;; Key bindings specific to go-mode
;;   (local-set-key (kbd "M-.") 'godef-jump)         ; Go to definition
;;   (local-set-key (kbd "M-*") 'pop-tag-mark)       ; Return from whence you came
;;   (local-set-key (kbd "M-p") 'compile)            ; Invoke compiler
;;   (local-set-key (kbd "M-P") 'recompile)          ; Redo most recent compile cmd
;;   (local-set-key (kbd "M-]") 'next-error)         ; Go to next error (or msg)
;;   (local-set-key (kbd "M-[") 'previous-error)     ; Go to previous error or msg
;; 
;;   ;; Misc go stuff
;;   (auto-complete-mode 1))                         ; Enable auto-complete mode
;; 
;; ;; Connect go-mode-hook with the function we just defined
;; (add-hook 'go-mode-hook 'my-go-mode-hook)
;; 
;; ;; Ensure the go specific autocomplete is active in go-mode.
;; (with-eval-after-load 'go-mode
;;    (require 'go-autocomplete))
;; 
;; ;; If the go-guru.el file is in the load path, this will load it.
;; (require 'go-guru)
;; 
;; ;; alternative go config

(require 'go-mode)

(exec-path-from-shell-copy-env "GOPATH")

(require 'company)
(require 'company-go)
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook `go-mode-hook `flycheck-mode)

(require 'go-guru)
(add-hook `go-mode-hook `go-guru-hl-identifier-mode)
(set-face-attribute 'highlight nil :background "#FF0" :foreground "#000")

(require 'go-add-tags)
(global-set-key (kbd "C-c t") 'go-add-tags)

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)

(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save) ; gofmt before every save
  (setq gofmt-command "goimports")                ; gofmt uses invokes goimports
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

  (setq tab-width 4)
  ;; guru settings
  (go-guru-hl-identifier-mode)                    ; highlight identifiers
  
  ;; Key bindings specific to go-mode
  (local-set-key (kbd "M-.") 'godef-jump)         ; Go to definition
  (local-set-key (kbd "M-*") 'pop-tag-mark)       ; Return from whence you came
  (local-set-key (kbd "M-p") 'compile)            ; Invoke compiler
  (local-set-key (kbd "M-P") 'recompile)          ; Redo most recent compile cmd
  (local-set-key (kbd "M-]") 'next-error)         ; Go to next error (or msg)
  (local-set-key (kbd "M-[") 'previous-error)     ; Go to previous error or msg

  ;; jto golang
  (local-set-key (kbd "C-c C-c") 'godoc-at-point)
 
  ;; Misc go stuff
  (auto-complete-mode 1))                         ; Enable auto-complete mode

;; Connect go-mode-hook with the function we just defined
(add-hook 'go-mode-hook 'my-go-mode-hook)

;;;



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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "3629b62a41f2e5f84006ff14a2247e679745896b5eaa1d5bcfbc904a3441b0cd" "d6922c974e8a78378eacb01414183ce32bc8dbf2de78aabcc6ad8172547cb074" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
