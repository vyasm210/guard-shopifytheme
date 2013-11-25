# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/shopifytheme/version'

Gem::Specification.new do |spec|
  spec.name          = "guard-shopifytheme"
  spec.version       = Guard::ShopifythemeVersion::VERSION
  spec.authors       = ["Danny Smith"]
  spec.email         = ["danny@dasmith.co.uk"]
  spec.description   = %q{Guard::Shopifytheme uses shopify_theme to update shopify when watched files are modified}
  spec.summary       = %q{Guard gem for updating shopify through shopify_theme}
  spec.homepage      = "http://github.com/dannysmith/guard-shopifytheme"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_path  = 'lib'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "shopify_theme", '>= 0.0.13'
  spec.add_dependency "guard", '~> 2.0'
end
