require 'bundler/capistrano'

$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"
set :rvm_ruby_string, 'ruby-1.9.2-head@octopress' 
set :rvm_type, :user  # Copy the exact line. I really mean :user here

set :application, "Nicinabox Octopress"
set :repository,  "git@nicinabox.com:nicinabox-octopress"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/srv/www/staging2.nicinabox.com"
set :user, 'nic'

role :web, "nicinabox.com"                          # Your HTTP server, Apache/etc
role :app, "nicinabox.com"                          # This may be the same as your `Web` server
role :db,  "nicinabox.com", :primary => true # This is where Rails migrations will run


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :resymlink, :roles => :app do
    run "rm -f #{current_path} && ln -s #{release_path} #{current_path}"
  end
  
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end