class ThemeStore < OpenStruct
  class << self
    def all
      [ThemeStore.new(hostname: 'testdb', loader: 'testdb', setting1: 'foo',
                      setting2: 'bar'),
       ThemeStore.new(hostname: 'testdb2', loader: 'testdb2', setting1: 'foo2',
                      setting2: 'bar2')]
    end
  end
end
