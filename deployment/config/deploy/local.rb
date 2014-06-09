server 'lucky-aws', user: 'vagrant', roles: %w{web}

# デプロイ対象ブランチ
set :repo_deploy, 'develop'

# rbenv対策
set :default_env, { path: "/Users/t-kitada/.rbenv/shims:$PATH" }

# デプロイする資産をclone
task :update do
  run_locally do
    
    branch = fetch :repo_deploy
    
    execute "cd ../#{fetch :repo_name}"
    execute "git checkout #{branch}; git pull"
    
  end
  
end

# デプロイする資産をパッケージ
task :archive do
  run_locally do
    if test "[ -e #{fetch :repo_archive}]"
      execute "rm -rf #{fetch :repo_archive}"
    end
    execute "cd ../#{fetch :repo_name}"
    execute "tar cfvz ../deployment/#{fetch :repo_archive} ./#{fetch :application}"    
  end
end

# アップロード
task :upload => :archive do
  on roles(:web) do
    upload! "./#{fetch :repo_archive}", "#{fetch :deploy_to}"
  end
end