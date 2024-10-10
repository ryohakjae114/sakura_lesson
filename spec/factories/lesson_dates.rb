FactoryBot.define do
  factory :lesson_date do
    date { Time.zone.tomorrow }
    start_time { '12:00' }
    end_time { '15:00' }
    capacity { 20 }
    url { 'https://example.com' }
    lesson
  end
end
