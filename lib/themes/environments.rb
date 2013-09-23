module Themes
  module Environments
    def list
      @list ||= Dir.entries(Rails.root.join('config', 'environments').to_s).
        select{ |f| f.match /.*\.rb/ }.
          map{|f| File.basename(f, '.rb').to_sym}
    end

    def method_missing(method_name, *arguments, &block)
      if block_given? && list.include?(method_name)
        block.call if Rails.env.send("#{method_name}?")
      else
        super
      end
    end
  end
end