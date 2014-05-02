# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'postmon_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "postmon_ruby"
  spec.version       = PostmonRuby::VERSION
  spec.authors       = ["Carlos Ribeiro"]
  spec.email         = ["mail@carlosribeiro.me"]
  spec.description   = "A rubygem to access the Postmon API"
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/PostmonAPI/postmon-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = 'postmon'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
end
