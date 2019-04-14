# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    name { 'テストレッスン' }
    description { 'RSpecを教えます。' }
    lesson_at { '2018/04/14' }
    place { '渋谷' }
    user
  end
end
