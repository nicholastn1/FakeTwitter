FactoryBot.define do
  factory :user do
    email {"user#{rand(1...1000)}@user.com"}
    password {"123456"}
    name {"User"}
  end
end