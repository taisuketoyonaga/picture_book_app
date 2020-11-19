FactoryBot.define do
  factory :comment do
    comment                   {'abe'} 
    association :user
    association :content
  end
end
