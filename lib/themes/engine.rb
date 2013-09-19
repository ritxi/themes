module Themes
  class Engine < ::Rails::Engine
    config.theme = Themes

    initializer "themes.setup_theme" do |app|
      require Rails.root.join('config', 'themes', ENV['APP_THEME'])
      Themes::Loader.configure(app)
    end
  end
end