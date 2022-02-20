# frozen_string_literal: true

require 'slim'

@tab = 'tab1'
@tabs_group = 'group1'

content = '<p>Contents of a tab.</p>'

environment = {}
environment['key'] = 'myKey'
environment['@tab_name'] = 'tab1'
environment["tabs-#{@tabs_group}"] ||= {}
environment["tabs-#{@tabs_group}"][@tab] = content
environment['value'] = content

template = Slim::Template.new('test/template.slim', { 'pretty': true })

puts template.render(environment)
