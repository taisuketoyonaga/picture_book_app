FactoryBot.define do
  factory :content do
    name        {"カブトムシ"}
    kind_id     {1}
    place       {"公園"}
    memo        {"カッコイイ"}
    date        {"2020-9-10"}
    association :user
    
  end
end
