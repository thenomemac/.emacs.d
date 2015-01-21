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

### setup javascript environment
#### install tern packages

```
cd ~/.emacs.d/externals/tern
npm install
```
