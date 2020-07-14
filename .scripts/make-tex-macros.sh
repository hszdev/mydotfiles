#!/bin/sh

mkdir ~/.vim/after/ftplugin/ --parents
cat ./vim-files/tex_macros.tex > ~/.vim/after/ftplugin/tex_macros.tex
