class Test2Loader < Themes::BaseLoader
  HOSTNAMES = %w[test2 b2 c2].freeze

  def self.configure
    Themes.email = 'test2@test.cat'
  end
end
