# Guard::Shopifytheme
[![Gem Version](https://badge.fury.io/rb/guard-shopifytheme.png)](http://badge.fury.io/rb/guard-shopifytheme)

Uses [Guard](https://github.com/guard/guard) to watch for changes and update Shopify when a file is changed. Very similar functionality to [guard-shopify](https://github.com/1337807/guard-shopify), except that it uses the [shopify_theme](https://github.com/Shopify/shopify_theme) gem to do most of the work. This has a couple of advantages:

* shopify_theme is maintained by Shopify, so will usually be up-to-date.
* The config settings are stored in the project directory (rather than in `~/.guard_shopify`, as with shopify-theme)
* If you choose to use the `theme watch` command provided by shopify_theme instead of Guard, then everything will still work properly – you don't need to maintain two sets of config files.

## Installation
Make sure you have installed [Guard](https://github.com/guard/guard).

Add this line to your application's Gemfile:

    gem 'guard-shopifytheme'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guard-shopifytheme

If you don't already have [shopify_theme](https://github.com/Shopify/shopify_theme) set up, create a `config.yml` file in your project directory (see [here](https://github.com/Shopify/shopify_theme#usage)):

````yaml
---
:api_key: YOUR_API_KEY
:password: YOUR_PASSWORD
:store: YOURSHOP.myshopify.com
:theme_id: 'YOUR_THEME_ID'
:ignore_files:
- README.md
- CHANGELOG.md
````

Add the Guard definition to your Guardfile with:

    $ guard init guard-shopifytheme

## Usage
There aren't many options, so usage is pretty simple:

````ruby
# Upload Changes to Shopify
guard :shopifytheme do
  watch(/assets\/.*/)
  watch(/config\/.*/)
  watch(/layout\/.*/)
  watch(/snippets\/.*/)
  watch(/templates\/.*/)
end
````


## An Alternative
If you don't want to install this gem, you can just add this to your Guardfile:

````ruby
require 'guard/plugin'

module ::Guard
  class ShopifyTheme < ::Guard::Plugin
    def run_all
    end

    def start
    end

    def run_on_changes(paths)
      paths.each do |path|
        system "theme upload #{path}"
      end
    end

    def run_on_removals(paths)
      paths.each do |path|
        system "theme remove #{path}"
      end
    end
  end
end
````

## Contributing
1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Todo
- Add some tests
- Improve `start()` to ask for your shopify API details and write them to config.yml

## Author
- Danny Smith ([@dannysmith](http://github.com/dannysmith))
- Shopfy_Theme by Shopify ([@shopify](https://github.com/Shopify))


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/dannysmith/guard-shopifytheme/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

