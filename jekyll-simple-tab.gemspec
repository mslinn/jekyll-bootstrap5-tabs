
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-simple-tab/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-simple-tab5"
  spec.version       = Jekyll::Simple::Tab5::VERSION
  spec.authors       = ["Artur Gabitov", "Mike Slinn"]
  spec.email         = ["applifort@gmail.com", "mslinn@mslinn.com"]

  spec.summary       = "Jekyll plugin for Boostrap 5 tabs"
  spec.description   = "Add Bootstrap 5 tabs to Jekyll content."
  spec.homepage      = "https://github.com/mslinn/jekyll-simple-tab5"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|spec|features|docs)/!)  }
  spec.require_paths = ["lib"]

  spec.add_dependency 'slim', '>= 3.0'
  spec.add_dependency 'jekyll', '>= 3.0'
end
