require 'rails_helper'

feature 'User', type: :feature do
  feature 'ユーザー登録前' do
    scenario 'ユーザー登録ができるか' do
      visit root_path
      click_on "登録"
      fill_in "nickname", with: "nota"
      fill_in "email", with: "rspec@gmail.com"
      fill_in "password", with: "0000000"
      fill_in "password_confirmation", with: "0000000"
      click_on "登録"
      expect(page).to have_content("登録")
    end

    scenario 'ログインできないか' do
      visit root_path
      click_on "ログイン"
      fill_in "email", with: "rspec@gmail.com"
      fill_in "password", with: "000000"
      click_on "ログイン", match: :first
      expect(page).to have_content ""
    end
  end

  feature 'ユーザー登録後', type: :feature do
    let(:user) { create(:user) }

    background do
      visit new_user_session_path
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "ログイン", match: :first
    end

    scenario 'ログインできているか' do
      expect(page).to have_content ""
    end

    scenario 'ログアウトできるか' do
      visit  destroy_user_session_path
      expect(page).to have_content ""
    end
  end
end
