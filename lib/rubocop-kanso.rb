require 'rubocop'

require_relative 'rubocop/kanso'
require_relative 'rubocop/kanso/version'
require_relative 'rubocop/kanso/inject'

RuboCop::Kanso::Inject.defaults!

require_relative 'rubocop/cop/kanso_cops'
