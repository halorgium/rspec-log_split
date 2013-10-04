require 'logger'

module RSpec
  module LogSplit
    class MyExample
      def initialize(logger, mod, example, example_logger)
        @logger = logger
        @mod = mod
        @example = example
        @example_logger = example_logger
      end

      def run
        @mod.logger = @example_logger
        begin
          error "starting #{description}"
          yield
        rescue Exception => e
          error "error with #{description}: #{e.inspect}"
          raise e
        ensure
          error "finishing #{description}"
          @mod.logger = nil
        end
      end

      def description
        @example.full_description
      end

      def error(message)
        @logger.error message
        @mod.logger.error message
      end
    end

    class Config
      def initialize(mod, dir)
        @mod = mod

        timestamp = Time.now.iso8601
        @path = Pathname.new(dir).join(timestamp)
        @path.mkpath
        @logger = Logger.new(@path.join("main"))
      end

      def run(example, &block)
        example_path = @path.join(example.location)
        example_path.parent.mkpath
        example_logger = Logger.new(example_path.to_path)
        MyExample.new(@logger, @mod, example, example_logger).run(&block)
      end
    end

    def self.apply
      RSpec.configure do |config|
        config.add_setting :log_split_module
        config.add_setting :log_split_dir
        config.add_setting :log_split

        config.before(:suite) do
          RSpec.configuration.log_split= Config.new(
            RSpec.configuration.log_split_module,
            RSpec.configuration.log_split_dir,
          )
        end

        config.around(:each) do |block|
          RSpec.configuration.log_split.run(example, &block)
        end

        config.after(:suite) do
          MyExample.list_logs if $DEBUG
        end
      end
    end
  end
end

RSpec::LogSplit.apply
