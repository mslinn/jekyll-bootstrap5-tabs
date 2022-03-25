# frozen_string_literal: true

require "liquid"
require "jekyll_plugin_logger"
require "slim"
require_relative "jekyll_bootstrap5_tabs/version"

DEFAULT_TEMPLATE = 'template.slim'

module JekyllBootstrap5Name
  PLUGIN_NAME = "jekyll_bootstrap5_tabs"
end

# Handles the outer {% tabs %}{% endtabs %} Liquid block for Bootstrap 5
class TabsBlock < Liquid::Block
  def initialize(tag, args, _)
    super

    raise SyntaxError, "#{tag} requires name" if args.empty?

    @logger = PluginMetaLogger.instance.new_logger(self)

    argv = args.strip.split
    @tab_name = argv[0] # TODO @tab_name is never used. Should act as a namespace.

    # Usage can override default and enable pretty-printing, not possible to disable per-tab
    @pretty_print = false
    if argv.length > 1 && argv[1].casecmp('pretty').zero?
      @pretty_print = true
      @logger.info { "Bootstrap tab pretty-printing is enabled for #{@tab_name}" }
    end
  end

  # @param config [YAML] Configuration data that might contain a entry for `jekyll_bootstrap5_tabs`
  # @param progname [String] The name of the `option:` subentry to look for underneath the `jekyll_bootstrap5_tabs` entry
  # @return [TrueClass, FalseClass]
  def check_config_boolean(config, _option)
    tabs_options = config['jekyll_bootstrap5_tabs']
    return false if tabs_options.nil?

    hash = tabs_options.detect { |opt| opt["pretty"] }
    @logger.debug { "tabs_options = #{tabs_options}" }
    @logger.debug { "hash = #{hash}" }
    !hash.nil? && hash['pretty']
  end

  def template_path(template_name)
    dir = File.dirname(__FILE__)
    File.join(dir, template_name.to_s)
  end

  def render(context)
    site = context.registers[:site]
    # Set the pretty-print option for the Slim engine
    # Global configuration provides the default value of @pretty_print
    if check_config_boolean(site.config, 'pretty')
      @pretty_print = true
      @logger.info { "Bootstrap tab pretty-printing is enabled by default for the entire Jekyll site." }
    end

    @environment = context.environments.first  # Has type Jekyll::Drops::UnifiedPayloadDrop
    @logger.debug { "TabsBlock.render: @environment = '#{@environment}'" }
    super

    template_file_path = template_path(DEFAULT_TEMPLATE)
    Slim::Engine.set_options :pretty => @pretty_print
    template = Slim::Template.new(template_file_path)
    template.render(self)
  end
end

# Handles the inner {% tab %}{% endtab %} Liquid block for Bootstrap 5
class TabBlock < Liquid::Block
  def initialize(tag, args, _)
    super

    @logger = PluginMetaLogger.instance.new_logger(self)

    @tabs_group, @tab = split_params(args.strip)
    @logger.debug { "TabBlock: @tabs_group = '#{@tabs_group}', @tab = '#{@tab}'" }
    raise SyntaxError, "Block #{tag} requires tabs name" if @tabs_group.empty? || @tab.empty?
  end

  def render(context)
    content = super

    environment = context.environments.first # Has type Jekyll::Drops::UnifiedPayloadDrop
    environment["tabs-#{@tabs_group}"] ||= {}
    environment["tabs-#{@tabs_group}"][@tab] = content
  end

  private

  def split_params(params)
    params.split('#')
  end
end

PluginMetaLogger.instance.info { "Loaded #{JekyllBootstrap5Name::PLUGIN_NAME} v#{JekyllBootstrap5Tabs::VERSION} plugin." }
Liquid::Template.register_tag('tabs', TabsBlock)
Liquid::Template.register_tag('tab', TabBlock)
