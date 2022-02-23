# frozen_string_literal: true

# See https://www.ruby-toolbox.com/projects/tilt

require 'listen'
require 'slim'

def Warning.warn(w)
  # Suppress 'warning: $SAFE will become a normal global variable in Ruby 3.0'
  if w !~ /warning: (URI.(un|)escape is obsolete|\$SAFE will become a normal global variable)/
    super w
  end
end

# rubocop:disable Metrics/MethodLength
def process_once(scope)
  puts "\n#{Time.new.localtime.strftime('%H:%M:%S')}"
  template = Slim::Template.new('test/template.slim', { 'pretty': true })
  begin
    puts(template.render(scope))
  rescue StandardError => e
    if e.message == "undefined method `[]' for nil:NilClass"
      puts 'The slim template references an undefined variable or has a syntax error'
    else
      puts e.message
    end
  end
end
# rubocop:enable Metrics/MethodLength

# Represent an environment, which holds name/value pairs
class Env
  attr_accessor :name
end

scope = Env.new
scope.name = 'Testing, 1-2-3, testing'

process_once(scope)
listener = Listen.to('./test/') do
  process_once(scope)
end
listener.start
sleep
