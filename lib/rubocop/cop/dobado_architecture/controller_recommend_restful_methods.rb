# frozen_string_literal: true

module RuboCop
  module Cop
    module DobadoArchitecture
      include VisibilityHelp
      include DefNode

      # コントローラーのアクション名として、RESTfulなメソッド名
      # (index, show, new, edit, create, update, destroy)を推奨するためのCop
      #
      # @example
      #   # bad
      #   class UsersController < ApplicationController
      #     def bad_method; end
      #   end
      #
      #   # good
      #   class UsersController < ApplicationController
      #     def index; end
      #   end
      class ControllerRecommendRestfulMethods < Base
        MSG = 'RESTful(index, show, new, edit, create, update, destroy)なメソッド名の使用を推奨します'

        # @!method action_declarations(node)
        def_node_search :action_declarations, <<~PATTERN
          (def ...)
        PATTERN

        def on_class(node)
          node = action_declarations(node).first
          return if %i[index show new edit create update destroy].include?(node.method_name)

          add_offense(node.loc.name)
        end
      end
    end
  end
end
