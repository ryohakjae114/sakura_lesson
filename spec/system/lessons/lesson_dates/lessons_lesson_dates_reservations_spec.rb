require 'rails_helper'

RSpec.describe 'Lessons::LessonDates::Reservations', type: :system do
  context '' do
    let!(:hakjae) { create(:user) }
    let!(:lesson) { create(:lesson, published: true, title: 'そろばん') }
    let!(:lesson_date) { create(:lesson_date, lesson:, start_at: '2024-10-17-12:00:00', end_at: '2024-10-17-13:00:00') }

    context 'ログイン時' do
      before do
        hakjae.confirm
        sign_in hakjae
      end

      it 'レッスン開催日に登録できること' do
        visit lesson_lesson_dates_path(lesson)
        expect do
          click_on '予約する'
        end.to change(hakjae.reservations, :count).by(1)
        expect(page).to have_content '予約しました。マイページからご確認ください。'
        click_on 'マイページ'
        expect(page).to have_content 'そろばん'
        expect(page).to have_content '2024/10/17 12:00'
        expect(page).not_to have_link '予約する'
      end

      it 'レッスン開催日の予約を削除できること' do
        create(:reservation, lesson_date:, user: hakjae)
        visit my_page_path
        expect do
          click_on '予約キャンセル'
        end.to change(hakjae.reservations, :count).by(-1)
        expect(page).to have_content '予約をキャンセルしました。'
      end

      it 'すでに開催が開始されたレッスン開催日は表示されないこと' do
        lesson_date.update(start_at: '2024/10/15 10:00')
        visit lesson_lesson_dates_path(lesson)
        expect(page).not_to have_content '2024/10/15 10:00'
      end
    end

    context 'ログアウト時' do
      it 'レッスン開催日に登録できずログイン画面に遷移すること' do
        visit lesson_lesson_dates_path(lesson)
        expect do
          click_on '予約する'
        end.not_to change(hakjae.reservations, :count)
        expect(page).to have_current_path new_user_session_path, ignore_query: true
      end
    end
  end
end
