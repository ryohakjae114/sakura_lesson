FactoryBot.define do
  factory :survey_answer do
    survey_question { nil }
    user { nil }
    content { 'MyString' }
  end
end
