# frozen_string_literal: true

require 'slim'

@tabs_group = 'group1'
@tab = 'tab1'

class Env
  attr_accessor :key, :tab_name, :value
end

def env_obj()
  environment = Env.new
  environment.key = 'myKey'
  environment.tab_name = 'tab1'
  environment["tabs-#{@tabs_group}"] ||= {}
  environment["tabs-#{@tabs_group}"][@tab] = content
  # environment.instance_eval { class << self; self end }.send(:attr_accessor, 'tabs-tab1')
  environment.value = '<p>Contents of a tab.</p>'
  environment
end

def env_hash(content)
  environment = {}
  environment['key'] = 'myKey'
  environment['@tab_name'] = 'tab1'
  environment["tabs-#{@tabs_group}"] ||= {}
  environment["tabs-#{@tabs_group}"][@tab] = content
  environment['value'] = '<p>Contents of a tab.</p>'
  environment
end

template = Slim::Template.new('test/template.slim', { 'pretty': true })

puts template.render(env_hash("blah"))
