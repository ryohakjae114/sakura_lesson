FactoryBot.define do
  factory :survey_answer do
    survery_question { nil }
    user { nil }
    content { "MyString" }
  end
end
