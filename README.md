# Activerecord::Dowsing

Add comment where is it called in your sql automatically. It's useful for code reading.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-dowsing'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-dowsing

## Usage

You can enable "activerecord-dowsing" by configuration.

config/application.rb

```
config.x.activerecord_dowsing.enabled = true
```

"activerecord-dowsing" changes all queries(with comment).

```
SELECT `id` FROM `users`
/* changes */
SELECT `id` FROM `users` /* /app/controllers/users_controller.rb:12:in `foo' */
```

If you want to mark for specific application, use `with_app_name` option.

```
config.x.activerecord_dowsing.with_app_name = true
```

```
SELECT `id` FROM `users`
/* changes */
SELECT `id` FROM `users` /* /app/controllers/users_controller.rb:12:in `foo'#app_name */
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file.
