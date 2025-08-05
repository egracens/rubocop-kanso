describe RuboCop::Cop::Kanso::NoRailsHelperRequire, :config do
  it 'registers an offense when requiring rails_helper' do
    expect_offense(<<~RUBY)
      require "rails_helper"
      ^^^^^^^^^^^^^^^^^^^^^^ Do not require "rails_helper" in spec files. Configure .rspec file with `--require spec_helper` and `--require rails_helper` instead.
    RUBY

    expect_correction('')
  end

  it 'does not register an offense when requiring spec_helper' do
    expect_no_offenses(<<~RUBY)
      require "spec_helper"
    RUBY
  end

  it 'does not register an offense for other requires' do
    expect_no_offenses(<<~RUBY)
      require "some_other_helper"
    RUBY
  end

  it 'registers an offense with single quotes' do
    expect_offense(<<~RUBY)
      require 'rails_helper'
      ^^^^^^^^^^^^^^^^^^^^^^ Do not require "rails_helper" in spec files. Configure .rspec file with `--require spec_helper` and `--require rails_helper` instead.
    RUBY

    expect_correction('')
  end

  it 'removes entire line including surrounding whitespace' do
    expect_offense(<<~RUBY)
      require 'rails_helper'
      ^^^^^^^^^^^^^^^^^^^^^^ Do not require "rails_helper" in spec files. Configure .rspec file with `--require spec_helper` and `--require rails_helper` instead.

      describe MyClass do
      end
    RUBY

    expect_correction(<<~RUBY)

      describe MyClass do
      end
    RUBY
  end
end
