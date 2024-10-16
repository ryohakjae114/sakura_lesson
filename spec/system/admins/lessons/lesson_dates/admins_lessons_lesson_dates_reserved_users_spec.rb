require 'rails_helper'

RSpec.describe 'Admins::Lessons::LessonDates::ReservedUsers', type: :system do
  let!(:hakjae) { create(:admin) }
  let!(:songjae) { create(:user, name: 'songjae') }
  let!(:sunae) { create(:user, name: 'sunae') }
  let!(:lesson_date) { create(:lesson_date) }

  before do
    sign_in hakjae
  end

  it '管理者はレッスン開催日に予約したユーザの一覧から見ることができる' do
    create(:reservation, user: songjae, lesson_date:)
    create(:reservation, user: sunae, lesson_date:)
    visit admins_lesson_lesson_dates_path(lesson_date.lesson)
    within '.test-reserved-users-link' do
      click_on '2'
    end
    expect(page).to have_content '予約したユーザ一覧'
    expect(page).to have_content 'songjae'
    expect(page).to have_content 'sunae'
  end
end
