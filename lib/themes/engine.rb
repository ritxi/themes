module Themes
  class Engine < ::Rails::Engine
    config.theme = Themes

    initializer 'themes.path_setup', before: 'action_mailer.set_configs' do
      config.theme.loader.push_dir(Rails.root.join('config', 'themes'))
      config.theme.loader.setup
      config.theme.themes_list.default = Themes::DefaultLoader
      config.theme.original_mailer_path = ActionMailer::Base._view_paths
      config.theme.original_controller_path = ActionController::Base._view_paths
    end

    initializer 'themes.middleware', after: 'themes.path_setup' do |app|
      app.middleware.use Themes::Middleware
    end

    initializer 'themes.setup_theme', after: 'themes.middleware' do |app|
      Dir.glob(Rails.root.join('config', 'themes', '*_loader.rb')) do |file|
        basename = File.basename(file, '.rb')
        loader = basename.classify.constantize
        loader.extend(Themes::Environments)
        app.config.theme.loaders[loader.name] = loader

        if defined?(loader::HOSTNAMES)
          loader::HOSTNAMES.each do |host|
            Themes.themes_list[host] = loader
          end
        end
      end

      Themes.themes_list.empty? && app.theme.collection.each do |theme|
        Themes.themes_list[theme.hostname] = lambda do
          app.config.theme.loaders[theme.loader].call
          Theme.config = theme
        end
      end
    end

    initializer 'themes.insert_helpers', after: 'themes.setup_theme' do |app|
      ActionController::Base.include(Themes::Helpers)
      ActionController::Base.extend(Themes::Helpers)
      ActionMailer::Base.extend(Themes::Helpers)
    end
  end
end
