FactoryBot.define do
  factory :tag_map  do
    association :place
    association :tag
  end
end
