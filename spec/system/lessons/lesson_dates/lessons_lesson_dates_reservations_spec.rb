require 'rails_helper'

RSpec.describe 'Lessons::LessonDates::Reservations', type: :system do
  let!(:hakjae) { create(:user) }
  let!(:lesson) { create(:lesson, published: true, title: 'そろばん') }

  context 'ログイン時' do
    before do
      hakjae.confirm
      sign_in hakjae
    end

    it 'レッスン開催日に登録できること' do
      create(:lesson_date, lesson:, start_time: '15:00', end_time: '18:00')
      visit lesson_lesson_dates_path(lesson)
      expect(page).not_to have_content '予約済み'
      expect do
        click_on '予約する'
      end.to change(hakjae.reservations, :count).by(1)
      expect(page).to have_content '予約しました。マイページからご確認ください。'
      click_on 'マイページ'
      expect(page).to have_content 'そろばん'
      expect(page).to have_content '15:00'
      expect(page).to have_content '18:00'
    end
  end

  context 'ログアウト時' do
    it 'レッスン開催日に登録できずログイン画面に遷移すること' do
      create(:lesson_date, lesson:)
      visit lesson_lesson_dates_path(lesson)
      expect do
        click_on '予約する'
      end.not_to change(hakjae.reservations, :count)
      expect(page).to have_current_path new_user_session_path, ignore_query: true
    end
  end
end
