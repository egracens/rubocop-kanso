require 'rubocop'
require 'rubocop/rspec/support'
require 'rubocop-kanso'

RSpec.configure do |config|
  config.include RuboCop::RSpec::ExpectOffense

  config.raise_errors_for_deprecations!
  config.raise_on_warning = true
  config.fail_if_no_examples = true

  config.order = :random
  Kernel.srand config.seed
end
