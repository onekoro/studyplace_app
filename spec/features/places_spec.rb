require 'rails_helper'

RSpec.describe "Places", type: :feature do
  it "ユーザーが新しい勉強場所を投稿する" do
    user = create(:user)
    
    valid_login(user)
    
    expect{
      click_link "場所投稿"
      fill_in "場所名", with: "テスト"
      fill_in "所在地", with: "東京"
      fill_in "Webページ", with: "test.com"
      fill_in "費用", with: 500
      select "あり", from: "Wifiの有無"
      select 3, from: "評価"
      fill_in "タグ入力", with: "コーヒーが美味しい 静か"
      click_button "投稿する"
      
      expect(page).to have_content "勉強場所を投稿しました"
      expect(page).to have_content "テスト"
      expect(page).to have_content "東京"
      expect(page).to have_content "test.com"
      expect(page).to have_content 500
      expect(page).to have_content "Wifi：あり"
      expect(page).to have_content "コーヒーが美味しい"
      expect(page).to have_content "静か"
    }.to change(user.places, :count).by(1)
    expect(page).to have_current_path place_path(Place.last), ignore_query: true
  end
end
