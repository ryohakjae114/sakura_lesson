FactoryBot.define do
  factory :lesson_date do
    start_at { '2024/10/17 12:00' }
    end_at { '2024/10/17 15:00' }
    capacity { 20 }
    url { 'https://example.com' }
    lesson
  end
end
