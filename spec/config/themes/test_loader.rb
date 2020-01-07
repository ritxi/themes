class TestLoader < Themes::BaseLoader
  HOSTNAMES = %w[test b c].freeze

  def self.configure
    Rails.logger.info 'configure test theme'
    Themes.name = 'test'
    Themes.email = 'test@test.cat'
  end
end
