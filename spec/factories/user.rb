FactoryGirl.define do 
  factory :user do 
    name "Coach K"
    email "coach@duke.edu"
    password "1k"
    password_confirmation "1k"
    public_profile true
  end
end