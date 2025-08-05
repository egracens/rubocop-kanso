module RuboCop
  module Cop
    module Kanso
      class NoRSpecDescribe < Base
        extend AutoCorrector

        MSG = 'Use `describe` instead of `RSpec.describe`.'.freeze

        def_node_matcher :rspec_describe?, <<~PATTERN
          (send
            (const nil? :RSpec) :describe
            ...)
        PATTERN

        def on_send(node)
          return unless rspec_describe?(node)

          add_offense(node.loc.expression.begin.join(node.loc.selector)) do |corrector|
            corrector.replace(node.loc.expression.begin.join(node.loc.selector), 'describe')
          end
        end
      end
    end
  end
end
