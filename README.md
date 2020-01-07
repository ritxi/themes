# Themes

Add simple themes to your rails applications

# Usage

Gemfile:

```ruby

gem "themes"

```

Run bundler and then create your first theme:

```bash

$ bundle install
$ rails generate themes:new my_theme sales@company.com

```

It will generate a configuration file.

```ruby
# encoding: utf-8

class MyThemeLoader
  def self.configure
    Themes.email = 'sales@company.com'

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

```

Folders to place views files and assets will be created.

- app/assets/javascripts/my_theme
- app/assets/stylesheets/my_theme
- app/views/themes/my_theme

## Sending Themed emails

Wherever you call deliver email enclose it like this:
```ruby
Theme.as('my_theme') { Notifier.wellcome_message(user) }
```

## Main features:

  - allow app to load diferent configuration depending on theme
  - Load theme using APP_THEME environment variable
  - Load views based on theme directory

## Code Status

* [![Build Status](https://api.travis-ci.org/ritxi/themes.png)](https://travis-ci.org/ritxi/themes)
* [![Coverage Status](https://coveralls.io/repos/ritxi/themes/badge.png)](https://coveralls.io/r/ritxi/themes)
