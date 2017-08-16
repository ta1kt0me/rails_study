#!/bin/sh

set -e

if [ ! -d "/app" ]; then
  rails app
  mkdir -p /app/db/migrate
  cp /tmp/database.yml /app/config/database.yml
  cp /tmp/001_create_tasks.rb /app/db/migrate/001_create_tasks.rb

  cd /app
  rake migrate
  script/generate scaffold Task
  echo 'created new project'
fi
cd /app
exec "$@"
