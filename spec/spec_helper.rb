require 'pry'

require 'rspec/log_split'

Dir["./spec/support/**/*.rb"].sort.each {|f| require f}

RSpec.configure do |config|
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  config.log_split_module = Demo
  config.log_split_dir = File.expand_path("../../log", __FILE__)
end
