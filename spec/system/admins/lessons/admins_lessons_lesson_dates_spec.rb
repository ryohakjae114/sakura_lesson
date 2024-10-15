require 'rails_helper'

RSpec.describe 'Admins::Lessons::LessonDates', type: :system do
  let!(:hakjae) { create(:admin) }
  let!(:lesson) { create(:lesson, title: 'カヤック', instructor: '阿久津', published: true) }

  before do
    sign_in hakjae
  end

  it 'レッスン開催日を一覧できること' do
    create(:lesson_date, date: '2025-10-10', start_time: '12:00:00', end_time: '15:00:00', capacity: 50, url: 'https://example.com/example', lesson:)
    visit admins_root_path
    within(".test_#{lesson.id}") do
      click_on 'レッスン開催日一覧'
    end
    expect(page).to have_content '2025-10-10'
    expect(page).to have_content '12:00'
    expect(page).to have_content '15:00'
    expect(page).to have_content '50'
    expect(page).to have_content 'https://example.com/example'
  end

  it 'レッスン開催日を登録できること' do
    tomorrow = Time.zone.tomorrow
    visit admins_lesson_lesson_dates_path(lesson)
    click_on 'レッスン開催日登録'
    select tomorrow.year, from: 'lesson_date[date(1i)]'
    select tomorrow.month, from: 'lesson_date[date(2i)]'
    select tomorrow.day, from: 'lesson_date[date(3i)]'
    select '13', from: 'lesson_date[start_time(4i)]'
    select '00', from: 'lesson_date[start_time(5i)]'
    select '15', from: 'lesson_date[end_time(4i)]'
    select '00', from: 'lesson_date[end_time(5i)]'
    fill_in '定員', with: 50
    fill_in 'リンク', with: 'https://example.com/meeting_url'
    expect do
      click_on '登録する'
    end.to change(lesson.lesson_dates, :count).by(1)
    expect(page).to have_content '新規登録しました'
  end

  it 'レッスン開催日を編集できること' do
    create(:lesson_date, date: '2025-10-10', start_time: '12:00:00', end_time: '15:00:00', capacity: 50, url: 'https://example.com/example', lesson:)
    visit admins_lesson_lesson_dates_path(lesson)
    click_on '編集'
    select '2024', from: 'lesson_date[date(1i)]'
    select '12', from: 'lesson_date[date(2i)]'
    select '25', from: 'lesson_date[date(3i)]'
    select '13', from: 'lesson_date[start_time(4i)]'
    select '00', from: 'lesson_date[start_time(5i)]'
    select '16', from: 'lesson_date[end_time(4i)]'
    select '00', from: 'lesson_date[end_time(5i)]'
    fill_in '定員', with: 100
    fill_in 'リンク', with: 'https://example.com/meeting_url'

    click_on '更新する'
    expect(page).to have_content '更新しました'
    expect(page).to have_content '2024-12-25'
    expect(page).to have_content '13:00'
    expect(page).to have_content '16:00'
    expect(page).to have_content '100'
    expect(page).to have_content 'https://example.com/meeting_url'
  end

  it 'レッスン開催日を削除できること' do
    create(:lesson_date, date: '2025-10-10', start_time: '12:00:00', end_time: '15:00:00', capacity: 50, url: 'https://example.com/example', lesson:)
    visit admins_lesson_lesson_dates_path(lesson)
    expect(page).to have_content 'https://example.com/example'
    expect do
      click_on '削除'
    end.to change(lesson.lesson_dates, :count).by(-1)
    expect(page).not_to have_content 'https://example.com/example'
  end
end
