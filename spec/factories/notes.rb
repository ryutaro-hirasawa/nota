FactoryBot.define do
  factory :note do
    title      {"rspec"}
    user_id    {FactoryBot.create(:user).id}
    status     {"英語"}
    subject    {"高校生"}
    text       {"単体テストです。"}
  end
end
