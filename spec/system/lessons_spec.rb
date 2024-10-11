require 'rails_helper'

RSpec.describe 'Lessons', type: :system do
  let!(:hakjae) { create(:admin) }

  before do
    sign_in hakjae
  end

  it 'レッスンを一覧できること' do
    create(:lesson, title: '算数', summary: '誰でも算数できるようになります', public: true)
    create(:lesson, title: '英語', summary: '誰でも英語できるようになります', public: true)
    create(:lesson, title: '魔法', summary: '公開したくない', public: false)

    visit root_path
    expect(page).to have_content 'レッスン一覧'
    expect(page).to have_content '算数'
    expect(page).to have_content '誰でも算数できるようになります'
    expect(page).to have_content '英語'
    expect(page).to have_content '誰でも英語できるようになります'
    expect(page).not_to have_content '魔法'
  end
end
