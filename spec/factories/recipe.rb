FactoryGirl.define do
  factory :recipe do
    name "Wheatgrass Smoothie"

    after(:create) do |recipe|
      create(:step, recipe: recipe)
      create(:proportion, recipe: recipe)
    end
  end
end



