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
end
