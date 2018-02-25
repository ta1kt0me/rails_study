desc "clean up for project"
task :clean do
  sh "docker-compose rm -sf"
  rm_rf "rails_apps/todo"
end

desc "build docker container"
task :build do
  sh "docker-compose build"
end

desc "build after clean"
task rebuild: [:clean, :build]

desc "docker-compose up"
task :up do
  sh "docker-compose up"
end
