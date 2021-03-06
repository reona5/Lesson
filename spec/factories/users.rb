# # frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'testuser' }
    email {|n| "test#{n}@example.com" }
    password { 'testpass' }
    password_confirmation { 'testpass' }
    # confirmed_at { Time.now }
  end
end
