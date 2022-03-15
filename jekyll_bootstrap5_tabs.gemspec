
require_relative 'lib/jekyll_bootstrap5_tabs/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll_bootstrap5_tabs'
  spec.version       = JekyllBootstrap5Tabs::VERSION
  spec.authors       = ['Artur Gabitov', 'Mike Slinn']
  spec.email         = ['applifort@gmail.com', 'mslinn@mslinn.com']

  spec.summary       = 'Jekyll plugin for Bootstrap 5 tabs'
  spec.description   = 'Enables Bootstrap 5 tabs in Jekyll 4 websites.'
  spec.homepage      = 'https://mslinn.com/blog/2022/02/13/jekyll-gem.html'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = 'https://github.com/mslinn/jekyll_bootstrap5_tabs'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.bindir = 'bin'
  spec.executables = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.post_install_message = <<~END_MESSAGE

     Thanks for installing jekyll_bootstrap5_tabs!

  END_MESSAGE

  spec.add_dependency 'jekyll', '>= 3.5'
  spec.add_dependency 'slim', '~> 3.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'debase'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  # spec.add_development_dependency 'rubocop-jekyll'
  # spec.add_development_dependency 'rubocop-rake'
  # spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency 'ruby-debug-ide'
end
