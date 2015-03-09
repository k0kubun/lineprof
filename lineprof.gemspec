# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lineprof/version'

Gem::Specification.new do |spec|
  spec.name          = "lineprof"
  spec.version       = Lineprof::VERSION
  spec.authors       = ["Takashi Kokubun"]
  spec.email         = ["takashikkbn@gmail.com"]
  spec.summary       = %q{Easy-to-use line profiler for Ruby.}
  spec.description   = %q{Easy-to-use line profiler for Ruby.}
  spec.homepage      = "https://github.com/k0kubun/lineprof"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rblineprof", "~> 0.3.6"
  spec.add_dependency "rack-lineprof", "~> 0.0.3"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
end
