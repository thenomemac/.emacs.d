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

#### Slack

Set the following environment variables (follow instructions [here](https://github.com/yuya373/emacs-slack)) to get the required values:

* `EMACS_SLACK_<TEAM>_CLIENT_ID`
* `EMACS_SLACK_<TEAM>_CLIENT_SECRET`
* `EMACS_SLACK_<TEAM>_TOKEN`

Note: You'll have to do this for each team you want to connect to.
