FactoryBot.define do
  factory :user do
    name                  { 'abe'}
    email                 {'kkk@gmail.com'}
    password              {'a00000'}
    password_confirmation {password}
  end
end
