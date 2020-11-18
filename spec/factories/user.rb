FactoryBot.define do

  factory :user do
    nickname              { "nota" }
    birthday              { "1990-01-01" }
    email                 { "rspec@gmail.com" }
    password              { "00000000" }
    password_confirmation { "00000000" }
  end

end
