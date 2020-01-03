
require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

require 'active_support/core_ext/module/attribute_accessors'

module Themes
  mattr_accessor :name
  @@name = nil

  mattr_accessor :email
  @@email = nil
end

Themes::Engine
