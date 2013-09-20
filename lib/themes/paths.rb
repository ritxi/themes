require 'active_support/concern'

module Themes
  module Paths
    extend ActiveSupport::Concern

    included do
      prepend_view_path(Rails.root.join('app', 'views', 'themes', current_theme))
    end
  end
end