# frozen_string_literal: true

require 'listen'
require 'slim'

def Warning.warn(w)
  # Suppress 'warning: $SAFE will become a normal global variable in Ruby 3.0'
  if w !~ /warning: (URI.(un|)escape is obsolete|\$SAFE will become a normal global variable)/
    super w
  end
end

def process_once(layout, content)
  puts "\n#{Time.new.localtime.strftime('%H:%M:%S')}"
  begin
    puts(layout.render { content })
    # puts(modified: modified, added: added, removed: removed)
  rescue NoMethodError => e
    if e.message == "undefined method `[]' for nil:NilClass"
      puts 'The slim template references an undefined variable or has a syntax error'
    else
      puts e.message
    end
  end
end

# Simple class to represent an environment
class Env
  attr_accessor :name
end

scope = Env.new
scope.name = 'Testing, 1-2-3, testing'

template_layout = <<~HTML
  h1 Hello
  .content
    = yield
HTML

slim_expression = <<~SLIM
  = name
SLIM

layout = Slim::Template.new { template_layout }
# layout = Slim::Template.new('test/template.slim', { 'pretty': true })
content = Slim::Template.new { slim_expression }.render(scope)

process_once(layout, content)
listener = Listen.to('./test/') { process_once content }
listener.start
sleep
