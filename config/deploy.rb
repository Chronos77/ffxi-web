# config valid for current version and patch releases of Capistrano
lock "~> 3.15.0"

set :application, "ffxi_web"
set :repo_url, "git@github.com:Chronos77/ffxi-web.git"

# If the environment differs from the stage name
set :rails_env, 'production'

# Defaults to :db role
set :migration_role, :db

# Defaults to the primary :db server
set :migration_servers, -> { primary(fetch(:migration_role)) }

# Defaults to `db:migrate`
set :migration_command, 'db:migrate'

# Defaults to false
# Skip migration if files in db/migrate were not modified
set :conditionally_migrate, true

# Defaults to [:web]
set :assets_roles, [:web, :app]

# Defaults to 'assets'
# This should match config.assets.prefix in your rails config/application.rb
set :assets_prefix, 'prepackaged-assets'

# Defaults to ["/path/to/release_path/public/#{fetch(:assets_prefix)}/.sprockets-manifest*", "/path/to/release_path/public/#{fetch(:assets_prefix)}/manifest*.*"]
# This should match config.assets.manifest in your rails config/application.rb
set :assets_manifests, ['app/assets/config/manifest.js']

# RAILS_GROUPS env value for the assets:precompile task. Default to nil.
set :rails_assets_groups, :assets

# If you need to touch public/images, public/javascripts, and public/stylesheets on each deploy
set :normalize_asset_timestamps, %w{public/images public/javascripts public/stylesheets}

# Defaults to nil (no asset cleanup is performed)
# If you use Rails 4+ and you'd like to clean up old assets after each deploy,
# set this to the number of versions to keep
set :keep_assets, 2
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/ubuntu/projects/ffxi_web"

# Default value for :format is :airbrussh.
set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

set :keep_releases, 5

append :linked_dirs, '.bundle'

append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "node_modules"


# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
