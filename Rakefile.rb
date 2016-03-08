require 'rspec/core/rake_task'

task default: %w(create_db spec)

task :create_db do
  sh 'sqlite3 rs-db < create-db.sql'
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec'
end
