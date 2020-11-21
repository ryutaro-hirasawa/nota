require 'rails_helper'

feature 'User', type: :feature do
  let(:user) { create(:user) }

  scenario '新規投稿ができるか' do
    visit root_path
    visit new_note_path
    fill_in "title", with: "rspec"
    find("#note_status").find("option[value='高校生']").select_option
    find("#note_subject").find("option[value='英語']").select_option
    fill_in "text", with: "単体テストです"
    click_on "投稿する"
    expect(page).to have_content("投稿")
  end
end
