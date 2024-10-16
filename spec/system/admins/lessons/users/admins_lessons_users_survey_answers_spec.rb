require 'rails_helper'

RSpec.describe 'Admins::Lessons::Users::SurveyAnswers', type: :system do
  let!(:hakjae) { create(:admin) }
  let!(:lesson) { create(:lesson) }
  let!(:survey_question_1) { create(:survey_question, lesson:) }
  let!(:survey_question_2) { create(:survey_question, lesson:) }
  let!(:sunae) { create(:user, name: 'sunae', email: 'sunae@example.com') }

  before do
    sunae.confirm
    sign_in hakjae
  end

  it '予約したユーザのアンケートの回答を閲覧することができる' do
    create(:survey_answer, user: sunae, survey_question: survey_question_1, content: '良い感じ')
    create(:survey_answer, user: sunae, survey_question: survey_question_2, content: 'ちょっといや')
    visit admins_root_path
    click_on 'アンケート回答者一覧'
    click_on 'アンケートの回答'
    expect(page).to have_content 'sunaeのアンケート回答'
    expect(page).to have_content '良い感じ'
    expect(page).to have_content 'ちょっといや'
  end
end
