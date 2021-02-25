# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

server "192.168.1.82", user: "ubuntu", roles: %w{app db web}
set :rvm_custom_path, '/usr/share/rvm'
set :rvm_ruby_version, '2.5.8'

set :use_sudo,  false
set :ssh_options, {forward_agent: true}
set :puma_bind, 'tcp://0.0.0.0:3000'
