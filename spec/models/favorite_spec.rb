require 'rails_helper'
describe Favorite do
  describe '#create' do

    it 'ログインできていたらお気に入り登録ができる' do
      favorite = build(:favorite, user: nil)
      favorite.valid?
      expect(favorite.errors[:user]).to include("を入力してください")
    end
  end
end