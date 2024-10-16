FactoryBot.define do
  factory :survey_question do
    lesson
    content { 'MyString' }
  end
end
