100.times do
  title = Faker::Sport.sport(include_ancient: true)
  summary = Faker::Lorem.sentence(word_count: rand(3..20))
  instructor = Faker::Name.name
  lesson = Lesson.create!(title:, summary:, instructor:)
  3.times do |time|
    today = Time.zone.today
    lesson.lesson_dates.create!(date: today.to_date + time, start_at: '12:00', end_time: '15:00', capacity: rand(1..100), url: "https://example.com/#{('a'..'z').to_a.sample(8).join}")
  end
end
