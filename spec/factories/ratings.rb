FactoryGirl.define do
  factory :rating do
    book nil
    user nil
    score 1
    default "MyString"  
  end
end
