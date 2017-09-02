FactoryGirl.define do
  factory :user do
    login "login"
    password "12345678"
    password_confirmation "12345678"
    name "姓名"
    profile { FactoryGirl.build(:profile) }
  end
end
