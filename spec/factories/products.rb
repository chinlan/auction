FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Prodcut #{n}" }
  end

  trait :published do
    status 'published'
  end

  trait :draft do
    stauts 'draft'
  end
end
