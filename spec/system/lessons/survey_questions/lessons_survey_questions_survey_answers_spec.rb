require 'rails_helper'

RSpec.describe 'Lessons::SurveyQuestions::SurveyAnswers', type: :system do
  let!(:hakjae) { create(:user) }
  let!(:survey_question) { create(:survey_question, content: '楽しいと思う？') }

  before do
    sign_in hakjae
    hakjae.confirm
  end

  it 'アンケートに回答できる' do
    visit new_survey_question_survey_answer_path(survey_question)
    expect(page).to have_content 'アンケート回答'
    expect(page).to have_content '楽しいと思う？'
    fill_in '回答内容', with: '楽しそうです'
    expect do
      click_on '回答する'
      expect(page).to have_content 'アンケートに回答しました'
    end.to change(hakjae.survey_answers, :count).by(1)
  end

  it 'アンケートを編集できる' do
    survey_answer = create(:survey_answer, survey_question:, user: hakjae, content: '楽しそうです')
    visit edit_survey_answer_path(survey_answer)
    expect(page).to have_content 'アンケート内容修正'
    expect(page).to have_field '回答内容', with: '楽しそうです'
    fill_in '回答内容', with: '楽しくなさそうです'
    click_on 'アンケートの内容を更新する'
    expect(page).to have_content 'アンケートの内容を修正しました'
    visit edit_survey_answer_path(survey_answer)
    expect(page).to have_field '回答内容', with: '楽しくなさそうです'
  end
end
