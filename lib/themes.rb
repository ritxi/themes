require 'zeitwerk'
require 'active_support/core_ext/module/attribute_accessors'

module Themes
  mattr_reader :loader
  @@loader = Zeitwerk::Loader.for_gem

  mattr_reader :themes_list
  @@themes_list = {}

  mattr_reader :loaders
  @@loaders = {}

  mattr_accessor :name
  @@name = nil

  mattr_accessor :default
  @@default = nil

  mattr_accessor :email
  @@email = nil

  mattr_accessor :model
  @@model = nil

  mattr_accessor :config
  @@config = nil

  mattr_accessor :original_mailer_path
  @@original_mailer_path = nil

  mattr_accessor :original_controller_path
  @@original_controller_path = nil

  def self.collection
    model.all
  end

  def self.as(theme_name)
    "#{theme_name}_loader".classify.constantize.call
    yield
    # .tap { Themes::DefaultLoader.load }
  end
end

require 'themes/engine'
Themes::Engine
