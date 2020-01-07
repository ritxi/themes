module Themes
  class BaseLoader
    class << self
      def klass_name
        /(.*)Loader/.match(name)[1].underscore
      end

      def call
        ActionMailer::Base.default from: Themes.email,
                                   template_path: "app/views/themes/#{klass_name}"

        [ActionMailer::Base, ActionController::Base].each do |klass|
          klass.prepend_view_path(Rails.root.join('app', 'views', 'themes', klass_name))
        end
        Themes.name = klass_name
        configure
      end

      def configure; end
    end
  end
end
