class TestLoader < Themes::BaseLoader
  HOSTNAMES = %w[test b c].freeze

  def self.configure(app)
    app.config.theme.name = 'test'
    app.config.theme.email = 'test@test.cat'
  end
end
