FROM centos:7

RUN yum -y update

# Fundamentals
RUN yum -y install git which sudo wget make
RUN yum -y install bzip2 gcc make openssl-devel readline-devel zlib-devel

# Install Vim with lua
RUN yum -y install lua-devel ncurses-devel perl-ExtUtils-Embed

WORKDIR /usr/local/src
RUN git clone https://github.com/vim/vim.git

WORKDIR /usr/local/src/vim
RUN git pull && make distclean
RUN ./configure \
  --prefix=/usr/local \
  --with-features=huge \
  --enable-multibyte \
  --enable-luainterp \
  --enable-cscope \
  --enable-fail-if-missing
RUN make
RUN make install
RUN vim --version

# dein
WORKDIR /root/.vim
RUN mkdir dein
RUN curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
RUN sh ./installer.sh ~/.vim/dein
RUN git clone https://github.com/cdmedia/itg_flat_vim.git
RUN mv itg_flat_vim/colors/ . && rm -rf itg_flat_vim

# .vimrc
WORKDIR /root
RUN git clone https://github.com/YMD7/dotfiles.git
RUN mv dotfiles/.vimrc . && rm -rf dotfiles/

# Setting Locale
RUN localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8
ENV LANG ja_JP.UTF-8

WORKDIR /root
