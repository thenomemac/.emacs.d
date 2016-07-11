## kp-emacs
---

My personal emacs configuration. This configuration is built to work with [Emacs for MacOSX](http://emacsformacosx.com/) and is last tested on:

```
$ emacs --version
GNU Emacs 24.4.1
```

Custom configuration is included for the following "languages":

* Python
* Golang
* Markdown
* Web (HTML/JavaScript/CSS)

### Dependency Quickstart

#### Home Directory

Set the environment variable `EMACS_HOME` to whatever directory you want `find-file` to start in.

#### Python

* `pip install autopep8`
* `pip install jedi`

#### Golang

* `go get -u github.com/nsf/gocode`
* (optional) `go get -u github.com/golang/lint/golint` (requires go 1.5+)
* (optional) `go get -u golang.org/x/tools/cmd/guru`
