module Themes
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      Themes.themes_list[env['SERVER_NAME']].call

      @app.call(env)
    end
  end
end
