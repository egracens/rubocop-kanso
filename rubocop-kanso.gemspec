Gem::Specification.new do |spec|
  spec.name          = 'rubocop-kanso'
  spec.version       = '1.0.0'
  spec.authors       = ['Vlad Petrovsky']
  spec.email         = ['egracens@gmail.com']

  spec.summary       = 'RuboCop cops for lightweight code - simplicity through elimination (簡素)'
  spec.description   = 'RuboCop extension focusing on simplicity and eliminating redundancy. ' \
                       'Kanso (簡素) is a Japanese principle of simplicity through elimination of clutter.'
  spec.homepage      = 'https://github.com/egracens/rubocop-kanso'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.2.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.glob('{config,lib}/**/*', File::FNM_DOTMATCH)
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rubocop', '>= 1.72'
  spec.add_dependency 'rubocop-rspec', '>= 3.0'
end
