require 'data_mapper'
require './app/app.rb'

namespace "database" do
  desc 'Non-destructive upgrade'
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto upgrade, no data loss"
  end

  desc 'Destructive upgrade'
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto migrate, data removed"
  end
end
