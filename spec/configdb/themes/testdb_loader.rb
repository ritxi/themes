class TestdbLoader < Themes::BaseLoader
  def self.configure
    Themes.email = 'testdb@test.cat'
  end
end
