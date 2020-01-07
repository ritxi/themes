module Themes
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      Themes.themes_list[env['SERVER_NAME']]&.load ||
        Themes::DefaultLoader.load
      @app.call(env)
    end
  end
end
