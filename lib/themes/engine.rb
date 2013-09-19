module Themes
  class Engine < ::Rails::Engine
    config.theme = Themes

    initializer "themes.setup_theme", before: 'action_mailer.set_configs' do |app|
      require Rails.root.join('config', 'themes', ENV['APP_THEME'])
      Themes::Loader.configure(app)
    end

    initializer "themes.configure_mailers", after: 'action_mailer.set_configs' do |app|
      ActionMailer::Base.default from: app.config.theme.email
    end

    initializer "themes.insert_helpers", after: 'themes.configure_mailers' do |app|
      ActionController::Base.send(:include,Themes::Helpers)
    end
  end
end