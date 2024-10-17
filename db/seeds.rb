100.times do
  title = Faker::Sport.sport(include_ancient: true)
  summary = Faker::Lorem.sentence(word_count: rand(3..20))
  instructor = Faker::Name.name
  published = rand(1..2) == 1
  lesson = Lesson.create!(title:, summary:, instructor:, published:)
  start_at = Time.zone.now + rand(1..6)
  end_at = start_at + rand(1..6)
  lesson.lesson_dates.create!(start_at:, end_at:, capacity: rand(1..100), url: "https://example.com/#{('a'..'z').to_a.sample(8).join}")
end
