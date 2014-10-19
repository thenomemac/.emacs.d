kwp-emacs
=========

A complete customization built for Emacs for MacOSX
http://emacsformacosx.com/


installation
=========

### get the repository

```
cd ~
rm -rf .emacs.d/
git clone https://github.com/kpurdon/kwp-emacs.git
git submodule update --init --recursive
```

### setup python environment
#### create a default virtualenv

```
mkdir ~/.virtual_envs/
virtualenv ~/.virtual_envs/default
. ~/.vritalenvs/default/bin/activate
pip install virtualenv jedi epc flake8
```

#### run the jedi setup in emacs

```
M-x jedi:install-server
```

### setup javascript environment
#### install tern packages

```
cd ~/.emacs.d/externals/tern
npm install
```
