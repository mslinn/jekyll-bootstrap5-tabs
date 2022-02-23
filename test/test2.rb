# frozen_string_literal: true

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

layout = Slim::Template.new { layout }
content = Slim::Template.new { contents }.render(scope)

puts layout.render{ content }
