FactoryBot.define do
  factory :book do
    title "My Comedy Series"
    author_name "John Paul"
    association :genre, factory: :genre  
  end
end

