
FactoryGirl.define do
  factory :photo_tagging, :class => Refinery::PhotoTaggings::PhotoTagging do
    sequence(:titel) { |n| "refinery#{n}" }
  end
end

