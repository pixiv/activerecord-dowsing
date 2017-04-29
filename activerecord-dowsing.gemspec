# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/dowsing/version'

Gem::Specification.new do |spec|
  spec.name          = 'activerecord-dowsing'
  spec.version       = ActiveRecord::Dowsing::VERSION
  spec.authors       = ['alpaca-tc']
  spec.email         = ['alpaca-tc@alpaca.tc']
  spec.license       = "MIT"

  spec.summary       = %q{Mark tiny callers (stacktrace) in your sql.}
  spec.description   = %q{Add comment where is it called in your sql automatically. It's useful for code reading.}
  spec.homepage      = 'https://github.com/pixiv/activerecord-dowsing'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'activerecord', '~> 4.2'
end
