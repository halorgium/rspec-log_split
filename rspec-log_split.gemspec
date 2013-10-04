Gem::Specification.new do |spec|
  spec.name          = "rspec-log_split"
  spec.version       = "0.0.2.pre"
  spec.authors       = ["Tim Carey-Smith"]
  spec.email         = ["tim@spork.in"]
  spec.description   = %q{A new logger for each example}
  spec.summary       = %q{Separate the logs between examples to allow for easier understanding}
  spec.homepage      = "https://github.com/halorgium/rspec-log_split"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
end
