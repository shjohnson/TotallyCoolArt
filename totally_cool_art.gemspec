# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'totally_cool_art/version'

Gem::Specification.new do |spec|
  spec.name          = "totally_cool_art"
  spec.version       = TotallyCoolArt::VERSION
  spec.authors       = ["Rob Kemp & Sam Johnson"]
  spec.email         = ["sam.johnson@fundingcircle.com"]
  spec.summary       = %q{Gem that allows you to book a ticket at Londons top galleries. Educational purpose only!!!}
  spec.description   = %q{This is a demonstration API used to teach about services & building gems. Students should create a gem that can set up the API connection and control HTTP requests / JSON parsing etc, and then build a simple user-facing sinatra app with that gem.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
