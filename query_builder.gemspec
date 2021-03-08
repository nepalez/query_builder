# encoding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "query_builder/version"

Gem::Specification.new do |gem|

  gem.name             = "query_builder"
  gem.version          = QueryBuilder::VERSION.dup
  gem.author           = "Andrew Kozin"
  gem.email            = "andrew.kozin@gmail.com"
  gem.homepage         = "https://github.com/nepalez/query_builder"
  gem.summary          = "Builder of the CQL statements."
  gem.description      = gem.summary
  gem.license          = "MIT"

  gem.files            = `git ls-files -z`.split("\x0")
  gem.executables      = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files       = gem.files.grep(%r{^(test|spec|features)/})
  gem.extra_rdoc_files = Dir["README.md", "LICENSE", "CHANGELOG.md"]
  gem.require_paths    = ["lib"]

  gem.required_ruby_version = ">= 2.5"

  gem.add_runtime_dependency "equalizer", "~> 0.0.11"
  gem.add_runtime_dependency "immutability", "~> 0.0.2"
  gem.add_runtime_dependency "transproc", "~> 0.4.0"

  gem.add_development_dependency "hexx-rspec", "~> 0.5"

end # Gem::Specification
