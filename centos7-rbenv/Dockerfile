FROM ymd7/centos7-vim-dein

RUN yum -y update

# Install [rbenv] [ruby-build]
ENV PATH /root/.rbenv/bin:$PATH
RUN \
  mkdir /root/.rbenv && \
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
  echo 'export PATH="/root/.rbenv/bin:$PATH"' >> /etc/profile.d/rbenv.sh && \
  echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN rbenv -v
