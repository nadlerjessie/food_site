FactoryGirl.define do
  factory :recipe do
    name "Wheatgrass Smoothie"

    # factory :step do 
    #   step {Step.first || FactoryGirl.create(:step)}
    # end

    # factory :proportion do 
    #   proportion {Proportion.first || FactoryGirl.create(:proportion)}
    # end
    after(:create) do |recipe|
      create(:step, recipe: recipe)
      create(:proportion, recipe: recipe)
    end
  end
end



