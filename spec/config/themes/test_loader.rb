class TestLoader < Themes::BaseLoader
  HOSTNAMES = %w[test b c].freeze

  def self.configure
    Themes.email = 'test@test.cat'
  end
end
