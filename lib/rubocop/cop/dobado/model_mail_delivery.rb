# frozen_string_literal: true

module RuboCop
  module Cop
    # Dobadoに関するCop
    module Dobado
      # モデル内でメール送信（deliver_now/deliver_later）の呼び出しを非推奨にするためのCop
      #
      # @example
      #   # bad
      #   class User < ApplicationRecord
      #     after_create do
      #       UserMailer.welcome_email(user).deliver_now
      #     end
      #   end
      #
      #   # good
      #   class User < ApplicationRecord
      #     after_create do
      #       # move to controller or interactor
      #     end
      #   end
      class ModelMailDelivery < Base
        MSG = 'モデル内でメール送信（deliver_now/deliver_later）を呼び出すのは非推奨です'

        def on_send(node)
          return unless %i[deliver_now deliver_later].include?(node.method_name)

          add_offense(node.loc.selector)
        end

        alias on_csend on_send
      end
    end
  end
end
