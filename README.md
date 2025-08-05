# RuboCop Kanso (簡素)

RuboCop extension for writing clean, minimal Ruby code. Kanso (簡素) is a Japanese principle meaning simplicity through elimination of clutter.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubocop-kanso', require: false
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install rubocop-kanso
```

## Usage

Add the following to your `.rubocop.yml`:

```yaml
plugins:
  - rubocop-kanso

# Optional: Configure the cops
Kanso/NoRailsHelperRequire:
  Enabled: true

Kanso/NoRSpecDescribe:
  Enabled: true
```

## Cops

### Kanso/NoRailsHelperRequire

This cop disallows requiring `rails_helper` in spec files. Instead, configure your `.rspec` file in the project root with the following lines:

```
--require rails_helper
```

**Bad:**

```ruby
require "rails_helper"
```

**Good:**

Configure `.rspec` file:

```
--require rails_helper
```

And remove the require statement from your spec files.

**Auto-correction:** ✅ Supported (removes the require statement)

### Kanso/NoRSpecDescribe

This cop enforces using `describe` instead of `RSpec.describe` for consistency.

**Bad:**

```ruby
RSpec.describe MyClass do
  # spec content
end
```

**Good:**

```ruby
describe MyClass do
  # spec content
end
```

**Auto-correction:** ✅ Supported

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `bundle exec rspec` to run the tests.

## Testing

Run the test suite with:

```bash
bundle exec rspec
```

## Building the Gem

To build the gem:

```bash
gem build rubocop-kanso.gemspec
```

## Publishing

To release a new version:

1. Update the version number in `lib/rubocop/kanso/version.rb`
2. Run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org)

Or manually:

```bash
gem build rubocop-kanso.gemspec
gem push rubocop-kanso-1.x.x.gem
```

## Contributing

Bug reports and pull requests are welcome on GitHub at <https://github.com/egracens/rubocop-kanso>.

## License

The gem is available as open source under the terms of the [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).
