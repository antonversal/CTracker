require 'data_updater/data_updater'
namespace :data_updater do

  desc "Load info about countries and currencies from server"
  task :load => :environment do
    DataUpdater.new.update
  end
end