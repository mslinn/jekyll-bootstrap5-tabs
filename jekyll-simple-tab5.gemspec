# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-simple-tab5'
  spec.version       = '1.0.0'
  spec.authors       = ['Artur Gabitov', 'Mike Slinn']
  spec.email         = ['applifort@gmail.com', 'mslinn@mslinn.com']

  spec.summary       = 'Jekyll plugin for Bootstrap 5 tabs'
  spec.description   = 'Add Bootstrap 5 tabs to Jekyll content.'
  spec.homepage      = 'https://github.com/mslinn/jekyll-simple-tab5'
  spec.license       = 'MIT'

  spec.files         = ['lib/jekyll-simple-tab5.rb', 'lib/template.slim']

  spec.required_ruby_version = '>= 2.5'

  spec.add_dependency 'jekyll', '>= 3.0'
  spec.add_dependency 'slim', '>= 3.0'
end
