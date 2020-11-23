require 'rails_helper'
describe Comment do
  describe '#create' do

    it 'コメントが入力されていないと投稿できない' do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end

    it 'ログインをしていないとコメント投稿できない' do
      comment = build(:comment, user: nil)
      comment.valid?
      expect(comment.errors[:user]).to include("を入力してください")
    end
  end
end