FactoryBot.define do
  factory :favorite do
    user_id    { FactoryBot.create(:user).id }
  end
end
