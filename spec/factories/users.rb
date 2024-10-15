FactoryBot.define do
  factory :user do
    name { 'hakjae' }
    email { |n| "user_#{n}@example.com" }
    password { '12341234' }
  end
end
