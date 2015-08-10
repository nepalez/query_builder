# encoding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cql_builder/version"

Gem::Specification.new do |gem|

  gem.name             = "cql_builder"
  gem.version          = CQLBuilder::VERSION.dup
  gem.author           = "Andrew Kozin"
  gem.email            = "andrew.kozin@gmail.com"
  gem.homepage         = "https://github.com/nepalez/cql_builder"
  gem.summary          = "Builder of the CQL requests."
  gem.description      = gem.summary
  gem.license          = "MIT"

  gem.files            = `git ls-files -z`.split("\x0")
  gem.executables      = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files       = gem.files.grep(%r{^(test|spec|features)/})
  gem.extra_rdoc_files = Dir["README.md", "LICENSE", "CHANGELOG.md"]
  gem.require_paths    = ["lib"]

  gem.required_ruby_version = "~> 1.9", ">= 1.9.3"

  gem.add_runtime_dependency "contracts", "~> 0.11"
  gem.add_runtime_dependency "equalizer", "~> 0.0.11"
  gem.add_runtime_dependency "ice_nine", "~> 0.11"

  gem.add_development_dependency "hexx-rspec", "~> 0.5"

end # Gem::Specification
