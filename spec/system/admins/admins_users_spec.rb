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
end
