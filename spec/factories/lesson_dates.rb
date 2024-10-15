FactoryBot.define do
  factory :lesson_date do
    date { Time.zone.tomorrow }
    start_at { '12:00' }
    end_at { '15:00' }
    capacity { 20 }
    url { 'https://example.com' }
    lesson
  end
end
