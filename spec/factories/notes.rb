FactoryBot.define do
  factory :note do
    title      {"rspec"}
    user_id    {FactoryBot.create(:user).id}
    status     {"1"}
    subject    {"1"}
    text       {"単体テストです。"}
  end
end
