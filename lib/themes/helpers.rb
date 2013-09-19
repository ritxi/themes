require 'active_support/concern'

module Themes
  module Helpers
    extend ActiveSupport::Concern

    def current_theme
      @current_theme ||= ::Themes.name
    end

    included do
      helper_method :current_theme
    end
  end
end