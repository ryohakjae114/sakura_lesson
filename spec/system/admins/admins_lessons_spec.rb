require 'rails_helper'

RSpec.describe 'Admins::Lessons', type: :system do
  let!(:hakjae) { create(:admin) }

  before do
    sign_in hakjae
  end

  it 'レッスンを登録できること' do
    visit admins_root_path
    click_on 'レッスン登録', match: :first
    fill_in 'レッスン名', with: '英語'
    fill_in '概要', with: '誰でも1時間で英語を使いこなせるようになれるかもしれない'
    fill_in '講師', with: '匠先生'
    check '公開'
    expect do
      click_on '登録する'
      expect(page).to have_content '新規登録しました'
    end.to change(Lesson, :count).by(1)
  end

  it 'レッスンを一覧できること' do
    create(:lesson, title: 'カヤック', instructor: '阿久津')
    create(:lesson, title: 'カジサック', instructor: '野々村')
    visit admins_root_path
    expect(page).to have_content 'カヤック'
    expect(page).to have_content '阿久津'
    expect(page).to have_content 'カジサック'
    expect(page).to have_content '野々村'
  end

  it 'レッスンを編集できること' do
    lesson = create(:lesson, title: 'カヤック', summary: 'いつでもカヤックしてます', instructor: '阿久津', published: false)
    visit edit_admins_lesson_path(lesson)
    fill_in 'レッスン名', with: 'カジサック'
    fill_in '概要', with: 'どこよりもカヤックしてます'
    fill_in '講師', with: '孫先生'
    check '公開'
    click_on '更新する'
    expect(page).to have_content '更新しました'
    expect(page).to have_field 'レッスン名', with: 'カジサック'
    expect(page).to have_field '概要', with: 'どこよりもカヤックしてます'
    expect(page).to have_field '講師', with: '孫先生'
    expect(page).to have_checked_field '公開'
  end

  it 'レッスンを削除できること' do
    create(:lesson, title: 'カヤック', summary: 'いつでもカヤックしてます', instructor: '阿久津', published: false)
    visit admins_root_path
    expect(page).to have_content 'カヤック'
    click_on '編集'
    expect do
      click_on '削除'
    end.to change(Lesson, :count).by(-1)
    expect(page).to have_content '削除しました'
  end
end
