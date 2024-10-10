require 'rails_helper'

RSpec.describe 'Admins::Lessons', type: :system do
  let!(:hakjae) { create(:admin) }

  before do
    sign_in hakjae
  end

  it 'レッスンを登録できること' do
    # TODO: rootページを作成した時に、rootページからアクセスするようにする
    visit new_admins_lesson_path
    fill_in 'レッスン名', with: '英語'
    fill_in '概要', with: '誰でも1時間で英語を使いこなせるようになれるかもしれない'
    fill_in '講師', with: '匠先生'
    check '公開'
    expect do
      click_on '登録する'
      expect(page).to have_content '新規登録しました'
    end.to change(Lesson, :count).by(1)
  end
end
