# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dropsync/version'

Gem::Specification.new "dropsync", DropSync::VERSION do |spec|
  spec.name          = "DropSync"
  spec.version       = DropSync::VERSION
  spec.authors       = ["Frank Kair"]
  spec.email         = ["frankkair@gmail.com"]

  spec.summary       = "Simple Dropbox CLI"
  spec.description   = "Simple Dropbox CLI to download files and folders."
  spec.homepage      = "https://www.github.com/FrankKair/DropSync"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f =~ /docs\// }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency 'dropbox-sdk', '= 1.6.5', '= 1.6.5'
  spec.add_runtime_dependency 'mechanize', '= 2.7.5', '= 2.7.5'
end
