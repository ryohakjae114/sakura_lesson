require 'rails_helper'

RSpec.describe 'Lessons::SurveyQuestions', type: :system do
  let!(:hakjae) { create(:user) }
  let!(:lesson) { create(:lesson) }

  before do
    sign_in hakjae
    hakjae.confirm
  end

  it 'アンケート画面を閲覧できる' do
    create(:survey_question, content: '楽しいと思う？', lesson:)
    create(:survey_question, content: '良いと思う？', lesson:)
    visit lesson_survey_questions_path(lesson)
    expect(page).to have_content 'アンケート'
    expect(page).to have_content '楽しいと思う？'
    expect(page).to have_content '良いと思う？'
  end
end
