require 'slim'

# Simple class to represent an environment
class Env
  attr_accessor :name
end

scope = Env.new
scope.name = "test this layout"

layout =<<EOS
h1 Hello
.content
  = yield
EOS

contents =<<EOS
  = name
EOS

#layout = Slim::Template.new { layout }
layout = Slim::Template.new('test/template.slim', { 'pretty': true })
content = Slim::Template.new { contents }.render(scope)

puts layout.render{ content }

