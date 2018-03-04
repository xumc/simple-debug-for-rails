# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_debug/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_debug"
  spec.version       = SimpleDebug::VERSION
  spec.authors       = ["徐敏才"]
  spec.email         = ["hmilym@gmail.com"]
  spec.summary       = %q{Hightlight SQL in rails log}
  spec.description   = %q{Hightlight SQL in rails log}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_dependency "activerecord"
end
