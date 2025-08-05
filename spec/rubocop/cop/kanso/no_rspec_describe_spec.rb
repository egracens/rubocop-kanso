describe RuboCop::Cop::Kanso::NoRSpecDescribe, :config do
  it 'registers an offense when using RSpec.describe' do
    expect_offense(<<~RUBY)
      RSpec.describe MyClass do
      ^^^^^^^^^^^^^^ Use `describe` instead of `RSpec.describe`.
        it 'does something' do
        end
      end
    RUBY

    expect_correction(<<~RUBY)
      describe MyClass do
        it 'does something' do
        end
      end
    RUBY
  end

  it 'does not register an offense when using describe' do
    expect_no_offenses(<<~RUBY)
      describe MyClass do
        it 'does something' do
        end
      end
    RUBY
  end

  it 'registers an offense with string argument' do
    expect_offense(<<~RUBY)
      RSpec.describe "MyClass" do
      ^^^^^^^^^^^^^^ Use `describe` instead of `RSpec.describe`.
        it 'does something' do
        end
      end
    RUBY

    expect_correction(<<~RUBY)
      describe "MyClass" do
        it 'does something' do
        end
      end
    RUBY
  end

  it 'registers an offense with multiple arguments' do
    expect_offense(<<~RUBY)
      RSpec.describe MyClass, type: :model do
      ^^^^^^^^^^^^^^ Use `describe` instead of `RSpec.describe`.
        it 'does something' do
        end
      end
    RUBY

    expect_correction(<<~RUBY)
      describe MyClass, type: :model do
        it 'does something' do
        end
      end
    RUBY
  end
end
