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
            corrector.remove(removal_range(node))
          end
        end

        private

        def removal_range(node)
          range = range_by_whole_lines(node.source_range, include_final_newline: true)
          extend_range_for_blank_line(range, node.source_range.source_buffer)
        end

        def extend_range_for_blank_line(range, source_buffer)
          return range unless blank_line_follows?(range, source_buffer)

          Parser::Source::Range.new(source_buffer, range.begin_pos, range.end_pos + 1)
        end

        def blank_line_follows?(range, source_buffer)
          end_pos = range.end_pos
          end_pos < source_buffer.source.length && source_buffer.source[end_pos] == "\n"
        end
      end
    end
  end
end
