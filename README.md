# Marionette::Generators

Marionette Generators provides some Backbone/Marionette generators to build a full Marionette app.

It's still in development, so it only provides a starter app for now, and templates are only Slim and Skim.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'marionette-generators'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install marionette-generators

## Usage

### App

    $ rails g marionette:app NameOfYourApp

This will install bower-rails, slim-rails and skim gem, and create a `backbone` folder in app/assets/javascripts with all necessary directories and files. It will also create a `templates` folder in app/assets.

Then you should see a welcome message in your browser.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/marionette-generators. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

