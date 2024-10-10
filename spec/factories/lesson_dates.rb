FactoryBot.define do
  factory :lesson_date do
    date { '2024-10-10' }
    start_time { '2024-10-10 12:08:39' }
    end_time { '2024-10-10 12:08:39' }
    capacity { 1 }
    text { 'MyString' }
  end
end
