require_relative 'lib/rubocop/kanso/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubocop-kanso'
  spec.version       = RuboCop::Kanso::VERSION
  spec.authors       = ['Vlad Petrovsky']
  spec.email         = ['egracens@gmail.com']

  spec.summary       = 'RuboCop cops for lightweight code - simplicity through elimination (簡素)'
  spec.description   = 'RuboCop extension focusing on simplicity and eliminating redundancy. '
  spec.homepage      = 'https://github.com/egracens/rubocop-kanso'
  spec.license       = 'Apache-2.0'
  spec.required_ruby_version = '>= 3.2.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.metadata['default_lint_roller_plugin'] = 'RuboCop::Kanso::Plugin'

  spec.files = Dir.glob('{config,lib}/**/*', File::FNM_DOTMATCH) + ['VERSION']
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'lint_roller', '~> 1.0'
  spec.add_dependency 'rubocop', '>= 1.72'
  spec.add_dependency 'rubocop-rspec', '>= 3.0'
end
