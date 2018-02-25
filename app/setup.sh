#!/bin/sh

set -e

if [ ! -d "/apps/todo" ]; then
  cd /apps
  rails new todo
  cd /apps/todo
  sed -i -e "s/^# gem 'ruby-debug19'.*/gem 'pry'/" Gemfile
  rails generate scaffold Task name:string done_at:datetime
  rake db:migrate
  echo 'created new project'
fi

cd /apps/todo

$@
