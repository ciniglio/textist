# -*- encoding: utf-8 -*-
require File.expand_path('../lib/textist/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alejandro Ciniglio"]
  gem.email         = ["mail@alejandrociniglio.com"]
  gem.description   = %q{A gem to do basic feature extraction from text}
  gem.summary       = %q{Generates features from samples of text}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "textist"
  gem.require_paths = ["lib"]
  gem.version       = Textist::VERSION

  gem.add_dependency('sanitize', '2.0.3')
end
