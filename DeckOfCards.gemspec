# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'DeckOfCards/version'

Gem::Specification.new do |spec|
  spec.name          = "DeckOfCards"
  spec.version       = DeckOfCards::VERSION
  spec.authors       = ["Matt Thompson"]
  spec.email         = ["whatknight@gmail.com"]
  spec.summary       = "A library that provides a deck of cards"
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
