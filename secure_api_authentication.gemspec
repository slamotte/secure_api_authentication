# -*- encoding: utf-8 -*-
require File.expand_path('../lib/secure_api_authentication/version.rb', __FILE__)

Gem::Specification.new do |gem|
  gem.required_rubygems_version = Gem::Requirement.new(">= 0") if gem.respond_to? :required_rubygems_version=
  gem.authors       = ["Dave Kiger"]
  gem.email         = ["davejkiger@gmail.com"]
  gem.description   = %q{A gem which implements a standard api_key / secret authentication system for your Ruby on Rails web services.}
  gem.summary       = %q{With most Web APIs, it is important to know which app is using your resources and that only the apps you allow access those resources. This gem allows you to easily add this layer of authentication to any Rails resource you want, and it even includes protection against various forms of attack.}
  gem.homepage      = "http://slamote.github.com/secure_api_authentication/"

  #gem.files         = `git ls-files`.split($\)
  gem.files         = Dir.glob("{bin,lib}/**/*") + %w(CHANGELOG.md Gemfile LICENSE Rakefile README.md secure_api_authentication.gemspec)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "secure_api_authentication"
  gem.require_paths = ["lib"]
  gem.version       = SecureApiAuthentication::VERSION

  gem.add_runtime_dependency(%q<rails>, [">= 3.2.0"])
  gem.add_runtime_dependency(%q<uuid>, [">= 2.3.5"])
  gem.add_runtime_dependency(%q<chronic>, [">= 0.6.7"])
end
