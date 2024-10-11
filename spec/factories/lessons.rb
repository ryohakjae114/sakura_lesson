FactoryBot.define do
  factory :lesson do
    title { '英語' }
    summary { '実用的な英語を学びたい人、ここに集え' }
    instructor { 'MyString' }
    published { false }
  end
end
