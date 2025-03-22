# frozen_string_literal: true

RSpec.describe RuboCop::Cop::DobadoArchitecture::ControllerRecommendRestfulMethods, :config do
  example 'RESTfulでないメソッドを検知' do
    expect_offense(<<~RUBY)
      class UsersController < ApplicationController
        def bad_method
            ^^^^^^^^^^ RESTful(index, show, new, edit, create, update, destroy)なメソッド名の使用を推奨します
        end
      end
    RUBY
  end

  example 'RESTfulなメソッドは検知しない' do
    expect_no_offenses(<<~RUBY)
      class UsersController < ApplicationController
        def index
        end
      end
    RUBY
  end
end
