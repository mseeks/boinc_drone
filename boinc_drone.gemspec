# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'boinc_drone/version'

Gem::Specification.new do |spec|
  spec.name          = "boinc_drone"
  spec.version       = BoincDrone::VERSION
  spec.authors       = ["Matthew Sullivan"]
  spec.email         = ["msull92@gmail.com"]
  spec.summary       = "Simple script for reporting to a server about a boinc process."
  spec.description   = "This script allows the easily deployment of a boinc process farm where each drone reports back to a main application."
  spec.homepage      = "https://github.com/msull92/boinc_drone"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency "httparty"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
