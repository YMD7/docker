#!/bin/sh

# Rails 5.0.x でカレントディレクトリに rails new . する
docker run --rm -it -w /usr/src/docker_rails -v "$PWD":/usr/src/docker_rails ymd7/rails:5.0.x rails new .
