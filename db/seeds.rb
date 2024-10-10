100.times do
  title = Faker::Sport.unique.sport(include_ancient: true)
  summary = Faker::Lorem.sentence(word_count: rand(3..20))
  instructor = Faker::Name.name
  FactoryBot.create(:lesson, title:, summary:, instructor:)
end
