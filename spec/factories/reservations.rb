FactoryBot.define do
  factory :reservation do
    user
    lesson_date
    trait :skip_validation do
      to_create { |instance| instance.save(validate: false) }
    end
  end
end
