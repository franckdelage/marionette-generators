# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marionette/generators/version'

Gem::Specification.new do |spec|
  spec.name          = "marionette-generators"
  spec.version       = Marionette::Generators::VERSION
  spec.authors       = ["Franck Delage"]
  spec.email         = ["franck@web82.fr"]

  spec.summary       = %q{Provides some Backbone/Marionette generators for Rails 4.}
  spec.summary       = %q{Provides some Backbone/Marionette generators for Rails 4. Installs assets via Bower with bower-rails gem. For now, only provides a starter app, and only with slim and skim templates.}
  spec.homepage      = "https://github.com/franckdelage/marionette-generators"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "railties", ">= 3.1.0"
end
