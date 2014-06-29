server 'lucky-aws', user: 'vagrant', roles: %w{app,web,db}

# rbenv対策
#set :default_env, { path: "/Users/t-kitada/.rbenv/shims:$PATH" }

# デプロイブランチを対話的に指定
# @see http://qiita.com/Alice1017/items/ad061f33c8d42d52e079
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
