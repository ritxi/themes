module Themes
  class DefaultLoader
    class << self
      def call
        if Themes.default &&
           (loader = "#{Themes.default.classify}Loader".safe_constantize)
          return loader.load
        end

        ActionMailer::Base._view_paths = Themes.original_mailer_path
        ActionController::Base._view_paths = Themes.original_controller_path

        Themes.name = 'default'
      end
    end
  end
end
