# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reactivator/version'

Gem::Specification.new do |spec|
  spec.name          = 'reactivator'
  spec.version       = Reactivator::VERSION
  spec.authors       = ['Prateep Kul']
  spec.email         = ['1.0@kul.asia']

  spec.summary       = %q{React.js generator for rails using Freemind}
  spec.description   = %q{Generate React for Rails from Freemind}
  spec.homepage      = 'https://github.com/kul1/reactivator'
  spec.license       = 'MIT'
	spec.files         = Dir['Rakefile', '{bin,lib,test}/**/*', 'README*', 'LICENSE*', 'lib/generators/reactivator/templates/.env'] & `git ls-files -z`.split("\0")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
