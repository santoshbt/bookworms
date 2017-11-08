FactoryGirl.define do
  factory :comment do
    content "MyText"
    commentable_id 1
    commentable_type "MyString"
    ancestry "MyString"
  end
end
