require 'active_support/concern'

module Themes
  module Helpers
    extend ActiveSupport::Concern

    def current_theme
      ::Themes.model.present? ? ::Themes.config : ::Themes
    end

    included do
      helper_method :current_theme
    end
  end
end
