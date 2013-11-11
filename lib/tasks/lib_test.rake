namespace :test do
  desc "Libs test"
  Rails::TestTask.new(:libs => "test:prepare") do |t|
    t.pattern = 'test/libs/**/*_test.rb'
  end
end

Rake::Task["test"].enhance do
  Rake::Task["test:libs"].invoke
end

