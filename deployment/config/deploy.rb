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

# 独自タスク実装のため、デフォルトのタスクを削除
#framework_tasks = [ :pulishing]
#
#framework_tasks.each do |t|
#  Rake::Task["deploy:#{t}"].clear
#end
#
#Rake::Task[:deploy].clear

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

# デプロイアクションを拡張
namespace :deploy do

  # started hook
  # 準備完了後のアクション
  task :started do
    on release_roles :all do
      # todo LBから切り離し
      # LBからの切り離しは、apacheの停止をトリガーとしたい
      # @see http://docs.aws.amazon.com/ja_jp/ElasticLoadBalancing/latest/DeveloperGuide/TerminologyandKeyConcepts.html#healthcheck
      execute "sudo apachectl graceful-stop"
    end
  end

  # published hook
  # アプリケーションデプロイ直後のアクション
  task :published do
    on release_roles :all do
      # シムリンクをtokuten.auone.jpに貼り直す
      capture execute :rm, '-rf', current_path
      info output
      current_path = fetch(:deploy_to) +'/'+ fetch(:application)
      execute :rm, '-rf', current_path
      execute :ln, '-s', release_path.join(fetch(:application)) , current_path

      # todo APCuをクリア


    end
  end

  # finished hook
  # 全ての作業完了後のアクション
  task :finished do
    on release_roles :all do

      # todo LBに復旧
      # LBへの復旧は、apacheの起動をトリガーとしたい
      execute "sudo service httpd start"

    end
  end

  # アクションが失敗した場合の処理
  task :failed do
    on release_roles :all do

      # LBから切り離し(apache停止)
      execute "sudo service httpd stop"
      # todo エラーログを出力し、手動復旧

    end
  end
end
