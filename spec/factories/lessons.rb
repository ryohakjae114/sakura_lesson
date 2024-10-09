FactoryBot.define do
  factory :lesson do
    title { '英語' }
    summary { '実用的な英語を学びたい人、ここに集え' }
    maximum_allowed { 1 }
    instructor { 'MyString' }
    public { false }
  end
end
