FactoryBot.define do
  factory :comment do
    text {"コメントの単体テスト"}
    user_id    {FactoryBot.create(:user).id}
  end
end
