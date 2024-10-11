require 'rails_helper'

RSpec.describe 'MyPages', type: :system do
  let!(:hakjae) { create(:user) }

  context 'ログイン時' do
    before do
      hakjae.confirm
      sign_in hakjae
    end

    it 'マイページを閲覧できること' do
      visit root_path
      click_on 'マイページ'
      expect(page).to have_content '予約したレッスン一覧'
    end
  end

  context 'ログアウト時' do
    it 'マイページのリンクがヘッダに表示されいこと' do
      visit root_path
      expect(page).not_to have_content 'マイページ'
    end
  end
end
