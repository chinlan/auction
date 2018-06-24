FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Prodcut #{n}" }
  end
end
