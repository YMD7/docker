FROM centos:6.9

RUN yum -y update

############################################
# Fundamentals
############################################

RUN yum -y install git which sudo wget make
RUN yum -y install bzip2 gcc gcc-c++ make openssl-devel readline-devel zlib-devel libffi-devel

############################################
# Setting Locale
############################################

RUN localedef -i ja_JP -c -f UTF-8 -A /usr/share/locale/locale.alias ja_JP.UTF-8
ENV LANG ja_JP.UTF-8

############################################
# Install Vim with lua
############################################

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

# dein needs to open itself to install its plugins.
# You can use ymd7/centos7-vim-dein:installed-plugins

############################################
# Install [rbenv] [ruby-build]
############################################

ENV PATH $PATH:/root/.rbenv/bin
RUN \
  mkdir /root/.rbenv && \
  git clone https://github.com/rbenv/rbenv.git /root/.rbenv && \
  git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build && \
  echo 'export PATH="/root/.rbenv/bin:$PATH"' >> /etc/profile.d/rbenv.sh && \
  echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN rbenv -v

############################################
# Install Ruby:2.2.1
############################################

RUN RUBY_CONFIGURE_OPTS="--with-readline-dir=/usr/include/readline"
RUN rbenv install 2.2.1
RUN rbenv global 2.2.1
RUN rbenv exec gem install bundler
RUN rbenv rehash

ENV PATH $PATH:/root/.rbenv/versions/2.2.1/bin

############################################
# Build Rails Environment
############################################

ENV APP_ROOT /mnt/data/app
WORKDIR $APP_ROOT

# Add Repositories
RUN \
  yum -y install epel-release && \
  rpm -Uvh https://dev.mysql.com/get/mysql57-community-release-el6-11.noarch.rpm

# Install Libraries
RUN \
  yum -y install nodejs mysql-devel sqlite-devel && \
  yum -y install libjpeg-devel libpng-devel && \
  yum -y install ImageMagick ImageMagick-devel && \
  yum -y install mysql-community-server

