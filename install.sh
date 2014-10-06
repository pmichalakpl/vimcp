#!/bin/sh

VIMRC=~/.vimrc
VIMDIR=~/.vim
AUTOLOAD="$VIMDIR/autoload"
BUNDLE="$VIMDIR/bundle"
COLORS="$VIMDIR/colors"
FTPLUGIN="$VIMDIR/ftplugin"

if [ -e $VIMDIR ]
then
    cp -pr $VIMDIR $VIMDIR".bak_$(date +'%s')"
fi

if [ -e $VIMRC ]
then
    cp -pr $VIMRC $VIMRC".bak_$(date +'%s')"
fi

rm -rf $VIMDIR
rm -rf $VIMRC

# Prepare directories for plugins.
mkdir -p $AUTOLOAD $BUNDLE $COLORS $FTPLUGIN

# Install .vimrc.
wget -qO ~/.vimrc https://raw.githubusercontent.com/pmichalakpl/vimcp/master/.vimrc

# Install pathogen.
wget -qO $AUTOLOAD/pathogen.vim https://tpo.pe/pathogen.vim

# Install color scheme.
wget -qO $COLORS/wombat256mod.vim https://raw.githubusercontent.com/pmichalakpl/vimcp/master/.vim/colors/wombat256mod.vim

# Install powerline.
git clone https://github.com/Lokaltog/powerline.git $BUNDLE/powerline

# Install ctrlp.vim.
git clone https://github.com/kien/ctrlp.vim.git $BUNDLE/ctrlp.vim

# Install ack.
sudo apt-get install -y ack-grep
git clone https://github.com/mileszs/ack.vim.git $BUNDLE/ack.vim

# Install nerdcommenter.
git clone https://github.com/scrooloose/nerdcommenter.git $BUNDLE/nerdcommenter

# Install nerdtree.
git clone https://github.com/scrooloose/nerdtree.git $BUNDLE/nerdtree

# Install gitgutter
git clone git://github.com/airblade/vim-gitgutter.git $BUNDLE/nerdtree

# Install syntastic
git clone https://github.com/scrooloose/syntastic.git $BUNDLE/nerdtree

# Install vim autoformat
git https://github.com/Chiel92/vim-autoformat.git $BUNDLE/nerdtree

# Install easymontion
git clone https://github.com/Lokaltog/vim-easymotion ~/.vim/bundle/vim-easymotion $BUNDLE/nerdtree

# Install nerdtree-tabs
git clone https://github.com/jistr/vim-nerdtree-tabs.git $BUNDLE/nerdtree

# Install signify
git clone https://github.com/mhinz/vim-signify $BUNDLE/nerdtree

# Install vim-latex-preview
git clone https://github.com/xuhdev/vim-latex-live-preview.git $BUNDLE/nerdtree

# Install snipmate
git clone https://github.com/tomtom/tlib_vim.git  $BUNDLE/nerdtree
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git $BUNDLE/nerdtree
git clone https://github.com/garbas/vim-snipmate.git $BUNDLE/nerdtree


