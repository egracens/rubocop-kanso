module RuboCop
  module Cop
    module Kanso
      class NoRailsHelperRequire < Base
        extend AutoCorrector
        include RangeHelp

        MSG = 'Do not require "rails_helper" in spec files. ' \
              'Configure .rspec file with `--require spec_helper` and `--require rails_helper` instead.'.freeze
        RESTRICT_ON_SEND = [:require].freeze

        def_node_matcher :rails_helper_require?, <<~PATTERN
          (send nil? :require
            (str #rails_helper?))
        PATTERN

        def rails_helper?(str)
          str == 'rails_helper'
        end

        def on_send(node)
          return unless rails_helper_require?(node)

          add_offense(node) do |corrector|
            range = range_by_whole_lines(node.source_range, include_final_newline: true)
            corrector.remove(range)
          end
        end
      end
    end
  end
end
