# frozen_string_literal: true

module RuboCop
  module Cop
    module SmartMind
      class Interactor < RuboCop::Cop::Base
        # SEE: https://developers.bookwalker.jp/entry/2023/03/31/174906
        MSG = 'Interactor must always be used within an action.'

        def_node_matcher :use_interactor?, <<~PATTERN
          `(send _ :call _ )
        PATTERN

        def on_def(node)
          return unless in_controller?(node)
          return unless target_method?(node)
          return if use_interactor?(node)

          add_offense(node)
        end

        private

        def in_controller?(node)
          file_path_for_node(node).match('/controllers/').present?
        end

        def file_path_for_node(node)
          node.location.expression.source_buffer.name
        end

        def target_method?(node)
          %w(index show new edit create update destroy).include?(node.method_name.to_s)
        end
      end
    end
  end
end
