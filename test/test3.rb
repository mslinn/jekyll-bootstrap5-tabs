# frozen_string_literal: true

require 'listen'
require 'slim'

def Warning.warn(w)
  # Suppress 'warning: $SAFE will become a normal global variable in Ruby 3.0'
  if w !~ /warning: (URI.(un|)escape is obsolete|\$SAFE will become a normal global variable)/
    super w
  end
end

def process_once(scope)
  puts "\n#{Time.new.localtime.strftime('%H:%M:%S')}"
  template = Slim::Template.new('test/template.slim', { 'pretty': true })
  begin
    puts(template.render(scope))
  rescue NoMethodError => e
    if e.message == "undefined method `[]' for nil:NilClass"
      puts 'The slim template references an undefined variable or has a syntax error'
    else
      puts e.message
    end
  rescue e
    puts e.message
  end
end

# Simple class to represent an environment
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
