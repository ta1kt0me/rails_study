#!/bin/sh

set -e

if [ ! -d "/apps/todo" ]; then
  cd /apps
  rails todo
  cd /apps/todo
  cp /tmp/database.yml config/database.yml
  script/generate scaffold Task name:string done_at:datetime
  rake db:migrate
  echo 'created new project'
fi
cd /apps/todo
exec "$@"
