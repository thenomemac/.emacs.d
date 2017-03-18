# thenomemac/.emacs.d
## forked from: kpurdon/.emacs.d and others

**Note: the info below this isn't correct and/or up-todate**

My personal emacs configuration. This configuration is built to work with [Emacs for MacOSX](http://emacsformacosx.com/) and is last tested on:

```
$ emacs --version
GNU Emacs 25.1.1
```

Custom configuration is included for the following development modes:

* Golang
    * Automated struct tags (via [emacs-go-add-tags](https://github.com/syohex/emacs-go-add-tags))
    * ElDoc support (via [emacs-go-eldoc](https://github.com/syohex/emacs-go-eldoc))
    * Optional golint integration
    * Optional guru (formerly oracle) integration
* Python
    * Optional autopep8 support
* Markdown
    * Live Preview `M-x m-pr-m` (via markdown-preview-mode)
* JSON
    * via [json-mode](https://github.com/joshwnj/json-mode)
* Web
    * html w/ modified default settings (via [web-mode](http://web-mode.org/)
* JavaScript
    * via [js2-mode](https://github.com/mooz/js2-mode)

### Quickstart

1. Install [Emacs for MacOSX](http://emacsformacosx.com/)
2. Run `cd $HOME && rm -rf ./.emacs.d && git clone git@github.com:kpurdon/.emacs.d.git`
3. Install the following dependencies:

#### Golang (see development/_golang.el)

* `go get -u golang.org/x/tools/cmd/goimports`
* `go get -u github.com/nsf/gocode`
* `go get -u github.com/rogpeppe/godef`
* (optional) `go get -u github.com/golang/lint/golint` (requires go 1.5+)
* (optional) `go get -u golang.org/x/tools/cmd/guru`

#### Python (see development/_python.el)

* `pip install jedi`
* (optional) `pip install importmagic`
* (optional) `pip install autopep8`
