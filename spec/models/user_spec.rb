require 'rails_helper'

describe User do
  describe '#create' do

    it "ニックネーム,メールアドレス、パスワード、確認用パスワード、生年月日がある場合は登録可能" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "ニックネームがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "メールアドレスがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "パスワードがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードと確認用パスワードが一致しない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "生年月日がない場合は登録できないこと" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

    it "既存登録のメールアドレスでは新規登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "パスワードが5文字以下の場合は登録できないこと" do
      user = build(:user, password: "0000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it "パスワードが6文字以上の場合は登録できること" do
      user = build(:user, password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user).to be_valid
    end
  end
end