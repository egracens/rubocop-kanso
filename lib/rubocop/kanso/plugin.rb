require 'lint_roller'

module RuboCop
  module Kanso
    class Plugin < LintRoller::Plugin
      def about
        LintRoller::About.new(
          name: 'rubocop-kanso',
          version: VERSION,
          homepage: 'https://github.com/egracens/rubocop-kanso',
          description: 'RuboCop extension focusing on simplicity and eliminating redundancy.'
        )
      end

      def supported?(context)
        context.engine == :rubocop
      end

      def rules(_context)
        LintRoller::Rules.new(
          type: :path,
          config_format: :rubocop,
          value: Pathname.new(__dir__).join('../../config/default.yml')
        )
      end
    end
  end
end
