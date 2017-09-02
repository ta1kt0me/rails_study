#!/bin/sh

set -e

if [ ! -d "/apps/todo" ]; then
  cd /apps
  rails todo
  cd /apps/todo
  mkdir -p db/migrate
  cp /tmp/database.yml config/database.yml
  cp /tmp/001_create_tasks.rb db/migrate/001_create_tasks.rb
  sed  -i -e 's/require_gem\(.*\)/gem\1/' config/boot.rb
  rake migrate
  script/generate scaffold Task
  echo 'created new project'
fi
cd /apps/todo
exec "$@"
