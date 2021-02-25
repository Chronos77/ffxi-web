set :stage, :production
set :rails_env, :production
server '192.168.1.82', user: 'ubuntu', roles: %w{web app db}, port: 22
set :repo_url, 'git@github.com:Chronos77/ffxi-web.git'
set :deploy_to, '/home/ubuntu/projects/ffxi-web'

# set :rvm_path, '/usr/share/rvm/bin/rvm'
set :rvm_custom_path, '/usr/share/rvm'
set :rvm_ruby_string, 'ruby-2.5.8@ffxi-web'
set :rvm_ruby_version, 'ruby-2.5.8@ffxi-web'
# set :rvm_command, '/usr/share/rvm/bin/rvm'
set :bundle_string, '/home/ubuntu/.rvm/gems/ruby-2.5.8/bin/bundle'

set :rvm_type, :user
set :rvm_roles, [:app, :web]
set :puma_bind, 'tcp://0.0.0.0:3000'
