# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Dobado::ModelMailDelivery, :config do
  example 'モデル内でのメール送信を検知' do
    expect_offense(<<~RUBY)
      class User < ApplicationRecord
        after_create do
          UserMailer.welcome_email(user).deliver_now
                                         ^^^^^^^^^^^ モデル内でメール送信（deliver_now/deliver_later）を呼び出すのは非推奨です
        end
      end
    RUBY
  end

  example '&.を使用したメール送信も検知' do
    expect_offense(<<~RUBY)
      class User < ApplicationRecord
        after_create do
          UserMailer.welcome_email(user)&.deliver_now
                                          ^^^^^^^^^^^ モデル内でメール送信（deliver_now/deliver_later）を呼び出すのは非推奨です
        end
      end
    RUBY
  end
end
