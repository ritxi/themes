require 'active_support/core_ext/module/attribute_accessors'

module Themes
  mattr_accessor :name
  @@name = nil

  mattr_accessor :email
  @@email = nil

  autoload :Helpers, 'themes/helpers'
  autoload :Paths, 'themes/paths'
  autoload :Environments, 'themes/environments'
end

require 'themes/engine'