# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'tokuten.auone.jp'
set :repo_url, 'git@github.com:mediba-system/kittyhawk.git'
set :repo_name, 'kittyhawk'
set :repo_deploy, 'master'
set :repo_archive, 'tokuten.auone.jp.tgz'

#### 
## inialize
##

# 全タスクを一度削除
framework_tasks = [:starting, :started, :updating, :updated, :publishing, :published, :finishing, :finished]

framework_tasks.each do |t|
  Rake::Task["deploy:#{t}"].clear
end

Rake::Task[:deploy].clear

# デプロイブランチを対話的に指定
# @see http://qiita.com/Alice1017/items/ad061f33c8d42d52e079
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for keep_releases is 5
# set :keep_releases, 5
