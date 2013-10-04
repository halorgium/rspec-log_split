# Log Splitter for RSpec

This `RSpec` plugin allows you to change the logger for your library for each
separate example. This gives the ability to see the log output for each
specific test.

## Usage

Currently you must have a `class` or `module` which responds to two methods.
For example, `Rails` responds correctly:
* `Rails.logger`
* `Rails.logger=`

In your `Gemfile`:

``` ruby
gem "rspec-log_split"
```

In your `spec/spec_helper.rb`:

``` ruby
require "rspec/log_split"

RSpec.configure do |config|
  config.log_split_dir    = File.expand_path("../../log/#{Time.now.iso8601}", __FILE__)
  config.log_split_module = Rails
end
```

You will get a log file for each example as follows:
```
log/2013-10-05T00:47:14+13:00/main
log/2013-10-05T00:47:14+13:00/spec/demo_spec.rb:5
log/2013-10-05T00:47:14+13:00/spec/demo_spec.rb:9
log/2013-10-05T00:47:14+13:00/spec/support/shared_examples/win.rb:2
log/2013-10-05T00:47:14+13:00/spec/support/shared_examples/win.rb:7
```
