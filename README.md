## kp-emacs
---

My personal emacs configuration. This configuration is built to work with [Emacs for MacOSX](http://emacsformacosx.com/) and is last tested on:

```
$ emacs --version
GNU Emacs 25.1.1
```

Custom configuration is included for the following development modes:

* Golang
* Python

### Dependency Quickstart

#### Golang (see development/_golang.el)

* `go get -u golang.org/x/tools/cmd/goimports`
* `go get -u github.com/nsf/gocode`
* `go get -u github.com/rogpeppe/godef`
* (optional) `go get -u github.com/golang/lint/golint` (requires go 1.5+)
* (optional) `go get -u golang.org/x/tools/cmd/guru`

#### Python (see development/_python.el)

* `pip install autopep8`
* `pip install jedi`
