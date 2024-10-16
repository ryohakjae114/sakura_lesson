require 'rails_helper'

RSpec.describe 'Admins::Lessons::SurveyQuestions', type: :system do
  let!(:hakjae) { create(:admin) }
  let!(:lesson) { create(:lesson) }

  before do
    sign_in hakjae
  end

  it 'アンケートの作成、一覧ができる' do
    visit admins_lesson_survey_questions_path(lesson)
    expect(page).to have_content 'アンケートの質問一覧'
    click_on 'アンケートの質問作成'
    expect(page).to have_content 'アンケートの質問作成'
    fill_in '質問内容', with: '生きてる？'
    expect do
      click_on '登録する'
    end.to change(lesson.survey_questions, :count).by(1)
    expect(page).to have_content '新規登録しました'
    expect(page).to have_content '生きてる？'
  end

  it 'アンケートの削除ができる' do
    create(:survey_question, content: '生きてる？', lesson:)
    visit admins_lesson_survey_questions_path(lesson)
    expect(page).to have_content '生きてる？'
    expect do
      click_on '質問を削除'
    end.to change(lesson.survey_questions, :count).by(-1)
    expect(page).to have_content '削除しました'
  end
end
