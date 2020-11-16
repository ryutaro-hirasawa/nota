require 'rails_helper'
describe Comment do
  describe '#create' do

    it 'コメントが入力されていないと投稿できない' do
      comment = build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("can't be blank")
    end

    it 'ログインをしていないとコメント投稿できない' do
      comment = build(:comment, user: nil)
      comment.valid?
      expect(comment.errors[:user]).to include("can't be blank")
    end
  end
end