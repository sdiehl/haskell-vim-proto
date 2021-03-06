# haskell-vim-proto

Minimalist starter config for vim and Haskell.

* **[Article](http://www.stephendiehl.com/posts/vim_2016.html)**

For a more fully featured setup script see:

* **[haskell-vim-now]( https://github.com/begriffs/haskell-vim-now)**

#### Setup

```bash
$ git clone --recursive https://github.com/sdiehl/haskell-vim-proto.git 
$ cd haskell-vim-proto
$ cp -n vimrc ~/.vimrc   # Will not clobber existing config
$ cp -rn vim ~/.vim
```
Installs the following submodules using pathogen.

* ghcmod-vim
* neco-ghc
* vim-snipmate
* syntastic
* neocompletee.vim
* ctrlp.vim
* nerdtree
* nerdcommenter
* tabular
* supertab
* neocomplete
