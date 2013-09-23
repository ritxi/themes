require 'rails/generators'
require 'rails/generators/named_base'

class Themes::NewGenerator < Rails::Generators::NamedBase
  class Environments
    extend Themes::Environments
  end

  source_root File.expand_path('../templates', __FILE__)

  argument :name, type: :string, default: [], banner: "theme_name"
  argument :email, type: :string, default: [], banner: "theme_email"


  def create_theme_configuration_file
    template 'theme_loader.rb.erb', "config/themes/#{theme_name}.rb"
  end

  def create_views_initial_files
    empty_directory "app/views/themes/#{theme_name}"
    empty_directory "app/views/themes/#{theme_name}/layouts"
  end

  def create_assets_files
    empty_directory "app/assets/stylesheets/#{theme_name}"
    empty_directory "app/assets/javascripts/#{theme_name}"
  end

  def theme_name
    name
  end

  def theme_email
    email
  end
end