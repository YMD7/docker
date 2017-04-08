FROM centos:7

RUN yum -y update
RUN yum -y install git

# Dependencies for [ruby-build]
RUN yum -y install bzip2 gcc make openssl-devel readline-devel zlib-devel

# Install [rbenv] [ruby-build]
ENV PATH /root/.rbenv/bin:$PATH
RUN \
  mkdir /root/.rbenv && \
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
  echo 'export PATH="/root/.rbenv/bin:$PATH"' >> /etc/profile.d/rbenv.sh && \
  echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN rbenv -v
