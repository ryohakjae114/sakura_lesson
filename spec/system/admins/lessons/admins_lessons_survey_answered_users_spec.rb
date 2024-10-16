require 'rails_helper'

RSpec.describe 'Admins::Lessons::SurveyAnsweredUsers', type: :system do
  let!(:hakjae) { create(:admin) }
  let!(:songjae) { create(:user, name: 'songjae') }
  let!(:sunae) { create(:user, name: 'sunae') }

  let!(:survey_question) { create(:survey_question) }

  before do
    sign_in hakjae
  end

  it '管理者はアンケート回答者の一覧ができる' do
    create(:survey_answer, survey_question:, user: sunae)
    create(:survey_answer, survey_question:, user: songjae)

    visit admins_lesson_survey_answered_users_path(survey_question.lesson)
    expect(page).to have_content 'アンケート回答者一覧'
    expect(page).to have_content 'songjae'
    expect(page).to have_content 'sunae'
  end
end
