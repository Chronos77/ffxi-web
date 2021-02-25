set :stage, :production
set :rails_env, :production
server '192.168.1.82', user: 'ubuntu', roles: %w{web app db}, port: 22
set :repo_url, 'git@github.com:Chronos77/ffxi-web.git'
set :deploy_to, '/home/ubuntu/projects/ffxi-web'
set :ssh_options, {:forward_agent => true}
set :use_sudo,  true
set :user, 'ubuntu'
set :rvm_custom_path, '/usr/share/rvm'
set :rvm_ruby_string, 'ruby-2.5.8@ffxi-web'
set :rvm_ruby_version, 'ruby-2.5.8@ffxi-web'
set :bundle_string, '/home/ubuntu/.rvm/gems/ruby-2.5.8/bin/bundle'

set :rvm_type, :user
set :rvm_roles, [:app, :web]
set :puma_bind, 'tcp://0.0.0.0:3000'

server '192.168.1.82', port: 22, roles: [:web, :app, :db], primary: true

set :repo_url,        'git@github.com:Chronos77/ffxi-web.git'
set :application,     'ffxi_web'

# If using Digital Ocean's Ruby on Rails Marketplace framework, your username is 'rails'
set :user,            'ubuntu'
set :puma_threads,    [4, 16]
set :puma_workers,    0

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/projects/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord


namespace :puma do
    desc 'Create Directories for Puma Pids and Socket'
    task :make_dirs do
      on roles(:app) do
        execute "mkdir #{shared_path}/tmp/sockets -p"
        execute "mkdir #{shared_path}/tmp/pids -p"
      end
    end
  
    before 'deploy:starting', 'puma:make_dirs'
  end
  
  namespace :deploy do
    desc "Make sure local git is in sync with remote."
    task :check_revision do
      on roles(:app) do
  
        # Update this to your branch name: master, main, etc. Here it's main
        unless `git rev-parse HEAD` == `git rev-parse origin/main`
          puts "WARNING: HEAD is not the same as origin/main"
          puts "Run `git push` to sync changes."
          exit
        end
      end
    end
  
    desc 'Initial Deploy'
    task :initial do
      on roles(:app) do
        before 'deploy:restart', 'puma:start'
        invoke 'deploy'
      end
    end
  
    desc 'Restart application'
      task :restart do
        on roles(:app), in: :sequence, wait: 5 do
          invoke 'puma:restart'
        end
    end
  
    before :starting,     :check_revision
    after  :finishing,    :compile_assets
    after  :finishing,    :cleanup
    after  :finishing,    :restart
  end