module CtTableFor
  class << self
    mattr_accessor :table_for_default_class
    mattr_accessor :table_for_wrapper_default_class
    mattr_accessor :table_for_breakpoint
    mattr_accessor :table_for_icon_font_base_class
    mattr_accessor :table_for_action_icons
    mattr_accessor :table_for_numeric_percent_precision

    self.table_for_wrapper_default_class = "table-responsive"
    self.table_for_default_class = "table table-striped table-bordered table-condensed table-hover"
    self.table_for_breakpoint = "992px"
    self.table_for_icon_font_base_class = "fa"
    self.table_for_action_icons = {show: "eye", edit: "pencil", destroy: "trash", custom: "gear"}
    self.table_for_numeric_percent_precision = 2

  end

  # this function maps the vars from your app into your engine
  def self.setup(&block)
    yield self
  end

  class Engine < ::Rails::Engine
    isolate_namespace CtTableFor
    paths["app"]

    config.to_prepare do
      ApplicationController.helper(CtTableFor::ApplicationHelper)
    end
  end
end
