require 'rails_helper'

RSpec.describe 'Lessons', type: :system do
  it 'レッスンを一覧できること' do
    create(:lesson, title: '算数', summary: '誰でも算数できるようになります', published: true)
    create(:lesson, title: '英語', summary: '誰でも英語できるようになります', published: true)
    create(:lesson, title: '魔法', summary: '公開したくない', published: false)

    visit root_path
    expect(page).to have_content 'レッスン一覧'
    expect(page).to have_content '算数'
    expect(page).to have_content '誰でも算数できるようになります'
    expect(page).to have_content '英語'
    expect(page).to have_content '誰でも英語できるようになります'
    expect(page).not_to have_content '魔法'
  end

  it 'レッスン詳細ページを閲覧できること' do
    create(:lesson, title: '算数', summary: '誰でも算数できるようになります', instructor: '林田もやし', published: true)
    visit root_path
    click_on 'レッスン詳細'
    expect(page).to have_content 'レッスン詳細'
    expect(page).to have_content '算数'
    expect(page).to have_content '誰でも算数できるようになります'
    expect(page).to have_content '林田もやし'
  end
end
