require 'rails_helper'

RSpec.describe 'Admins::Users', type: :system do
  let!(:hakjae) { create(:admin) }

  let!(:sunae) { create(:user, name: 'sunae', email: 'sunae@example.com') }

  before do
    sunae.confirm
    sign_in hakjae
  end

  it 'ユーザを一覧できる' do
    create(:user, name: 'songjae', email: 'songjae@example.com')
    visit admins_users_path
    within('.test_songjae') do
      expect(page).to have_content 'songjae@example.com'
      expect(page).to have_content 'メール認証未'
    end
    within('.test_sunae') do
      expect(page).to have_content 'sunae@example.com'
      expect(page).to have_content 'メール認証済み'
    end
  end

  it 'ユーザの名前を編集できる' do
    visit admins_users_path
    within '.test_sunae' do
      click_link nil, href: edit_admins_user_path(sunae)
    end
    expect(page).to have_content 'ユーザ編集'
    fill_in '名前', with: 'sunao'
    click_on '更新する'
    expect(page).to have_content '更新しました'
    expect(page).to have_field '名前', with: 'sunao'
  end

  it 'ユーザを削除できる' do
    visit admins_users_path
    within '.test_sunae' do
      expect do
        click_on '削除する'
      end.to change(User, :count).by(-1)
    end
    expect(page).to have_content '削除しました'
  end
end
