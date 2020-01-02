module Themes
  class Loader
    def self.configure(app)
      app.config.theme.name = 'test'
      app.config.theme.email = 'test@test.cat'
    end
  end
end