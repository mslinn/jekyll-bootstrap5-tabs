# frozen_string_literal: true

require_relative "lib/jekyll_bootstrap5_tabs/version"

# rubocop:disable Metrics/BlockLength
Gem::Specification.new do |spec|
  github = "https://github.com/mslinn/jekyll_bootstrap5_tabs"

  spec.authors = ["Artur Gabitov", "Mike Slinn"]
  spec.bindir = "bin"
  spec.description = <<~END_DESC
    This Jekyll plugin enables Bootstrap 5 tabs in Jekyll 4 websites.
    Two new Liquid tags are provided: tabs and tab.
  END_DESC
  spec.email = ["applifort@gmail.com", "mslinn@mslinn.com"]
  spec.files = Dir[".rubocop.yml", "LICENSE.*", "Rakefile", "{lib,spec}/**/*", "*.gemspec", "*.md"]
  spec.homepage = "https://mslinn.com/blog/2022/02/13/jekyll-gem.html"
  spec.license = "MIT"
  spec.metadata = {
    "allowed_push_host" => "https://rubygems.org",
    "bug_tracker_uri"   => "#{github}/issues",
    "changelog_uri"     => "#{github}/CHANGELOG.md",
    "homepage_uri"      => spec.homepage,
    "source_code_uri"   => github,
  }
  spec.name = "jekyll_bootstrap5_tabs"
  spec.post_install_message = <<~END_MESSAGE

    Thanks for installing #{spec.name}!

  END_MESSAGE
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.6.0"
  spec.summary = "Jekyll plugin that enables Bootstrap 5 tabs in Jekyll 4 websites."
  spec.version = JekyllBootstrap5TabsVersion::VERSION

  spec.add_dependency "jekyll", ">= 3.5.0"
  spec.add_dependency "jekyll_plugin_logger"
  spec.add_dependency "slim", "~> 3.0"

  # spec.add_development_dependency "debase"
  # spec.add_development_dependency "rubocop-jekyll"
  # spec.add_development_dependency "rubocop-rake"
  # spec.add_development_dependency "rubocop-rspec"
  # spec.add_development_dependency "ruby-debug-ide"
end
# rubocop:enable Metrics/BlockLength
