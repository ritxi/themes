module Themes
  class DefaultLoader
    class << self
      def load
        ActionMailer::Base._view_paths = Themes.original_mailer_path
        ActionController::Base._view_paths = Themes.original_controller_path

        Themes.name = 'default'
      end
    end
  end
end
