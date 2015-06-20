# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'robot/version'

Gem::Specification.new do |spec|
  spec.name          = "robot"
  spec.version       = Robot::VERSION
  spec.authors       = ["bapu"]
  spec.email         = ["bapu.sethi.03@gmail.com"]
  spec.summary       = %q{Toy robot simulator}
  spec.description   = %q{Toy robot in ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
  
end