FactoryGirl.define do
  factory :user do
    login "login"
    password "123456"
    password_confirmation "123456"
    name "bran"
    profile
  end
end
