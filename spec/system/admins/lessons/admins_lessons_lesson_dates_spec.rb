require 'rails_helper'

RSpec.describe 'Admins::Lessons::LessonDates', type: :system do
  let!(:hakjae) { create(:admin) }
  let!(:lesson) { create(:lesson, title: 'カヤック', instructor: '阿久津', published: true) }

  before do
    sign_in hakjae
  end

  it 'レッスン開催日を一覧できること' do
    create(:lesson_date, start_at: '2024-10-17-12:00:00', end_at: '2024-10-17-13:00:00', capacity: 50, url: 'https://example.com/example', lesson:)
    visit admins_root_path
    within(".test_#{lesson.id}") do
      click_on 'レッスン開催日一覧'
    end
    expect(page).to have_content '2024/10/17 12:00'
    expect(page).to have_content '2024/10/17 13:00'
    expect(page).to have_content '50'
    expect(page).to have_content 'https://example.com/example'
  end

  it 'レッスン開催日を登録できること' do
    visit admins_lesson_lesson_dates_path(lesson)
    click_on 'レッスン開催日登録'
    select '2026', from: 'lesson_date[start_at(1i)]'
    select '11', from: 'lesson_date[start_at(2i)]'
    select '25', from: 'lesson_date[start_at(3i)]'
    select '15', from: 'lesson_date[start_at(4i)]'
    select '00', from: 'lesson_date[start_at(5i)]'

    select '2026', from: 'lesson_date[end_at(1i)]'
    select '11', from: 'lesson_date[end_at(2i)]'
    select '25', from: 'lesson_date[end_at(3i)]'
    select '17', from: 'lesson_date[end_at(4i)]'
    select '00', from: 'lesson_date[end_at(5i)]'

    fill_in '定員', with: 50
    fill_in 'リンク', with: 'https://example.com/meeting_url'
    expect do
      click_on '登録する'
    end.to change(lesson.lesson_dates, :count).by(1)
    expect(page).to have_content '新規登録しました'
  end

  it 'レッスン開催日を編集できること' do
    create(:lesson_date, start_at: '2024-10-17-12:00:00', end_at: '2024-10-17-13:00:00', capacity: 50, url: 'https://example.com/example', lesson:)
    visit admins_lesson_lesson_dates_path(lesson)
    click_on '編集'

    select '2026', from: 'lesson_date[start_at(1i)]'
    select '11', from: 'lesson_date[start_at(2i)]'
    select '25', from: 'lesson_date[start_at(3i)]'
    select '15', from: 'lesson_date[start_at(4i)]'
    select '00', from: 'lesson_date[start_at(5i)]'

    select '2026', from: 'lesson_date[end_at(1i)]'
    select '11', from: 'lesson_date[end_at(2i)]'
    select '25', from: 'lesson_date[end_at(3i)]'
    select '17', from: 'lesson_date[end_at(4i)]'
    select '00', from: 'lesson_date[end_at(5i)]'

    fill_in '定員', with: 100
    fill_in 'リンク', with: 'https://example.com/meeting_url'

    click_on '更新する'
    expect(page).to have_content '更新しました'
    expect(page).to have_content '2026/11/25 15:00'
    expect(page).to have_content '2026/11/25 17:00'
    expect(page).to have_content 'https://example.com/meeting_url'
  end

  it 'レッスン開催日を削除できること' do
    create(:lesson_date, start_at: '2024-10-17-12:00:00', end_at: '2024-10-17-13:00:00', capacity: 50, url: 'https://example.com/example', lesson:)
    visit admins_lesson_lesson_dates_path(lesson)
    expect(page).to have_content 'https://example.com/example'
    expect do
      click_on '削除'
    end.to change(lesson.lesson_dates, :count).by(-1)
    expect(page).not_to have_content 'https://example.com/example'
  end
end
