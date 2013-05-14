# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Conrad Irwin"]
  gem.email         = ["me@cirw.in"]
  gem.summary       = "Provides easy (tab-completable) access to instance variables and private methods"
  gem.description   = "When debugging in pry, it's useful to be able to access the instance variables of any object. This gem makes that trivial! Using foo.self.bar will give you @bar from the foo object, all while allowing tab-completion!"
  gem.homepage      = "https://github.com/ConradIrwin/self"
  gem.version       = "0.1"

  gem.files         = ["lib/self.rb"]
  gem.name          = "self"
  gem.require_paths = ["lib"]
end
