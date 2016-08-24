# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitmask_attribute/version'

Gem::Specification.new do |spec|
  spec.name          = "bitmask_attribute"
  spec.version       = BitmaskAttribute::VERSION
  spec.authors       = ["Madeline Carson"]
  spec.email         = ["madeline.carson@gmail.com"]
  spec.summary       = %q{Bitmask attribute helper methods for Rails models.}
  spec.description   = %q{Bitmask attribute helper methods for Rails models. Gives model access to methods to
                          check, add, and remove flags.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| f[3..-1] }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "activesupport", "~> 4.2"
end
