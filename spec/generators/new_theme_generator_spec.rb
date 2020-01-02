require 'spec_helper'
require 'generators/themes/new_generator'



describe Themes::NewGenerator do
  destination File.expand_path("../../tmp", __FILE__)
  arguments %w(brand_new_theme ricard@forniol.cat)

  before(:all) do
    prepare_destination
    run_generator
  end

  it 'generates theme loader' do
      assert_file "config/themes/brand_new_theme.rb", <<-FILE
# encoding: utf-8

class Themes::Loader
  def self.configure(app)
    app.config.theme.name = 'brand_new_theme'
    app.config.theme.email = 'ricard@forniol.cat'

    development do
      # Place development environment stuff here
    end

    production do
      # Place production environment stuff here
    end

    test do
      # Place test environment stuff here
    end
  end
end
FILE
  end

  it do
    expect(File.exists?("#{destination_root}/app/assets/javascripts/brand_new_theme")).to be(true)
    expect(File.exists?("#{destination_root}/app/assets/stylesheets/brand_new_theme")).to be(true)
    expect(File.exists?("#{destination_root}/app/views/themes/brand_new_theme/layouts")).to be(true)
  end
end
