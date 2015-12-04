require 'pry'
require 'spec_helper'
require 'rails_helper'

RSpec.describe Search, type: :model do
    # let(:user) {FactoryGirl.build(:user, id: 800)}

    context '#for' do 
      before do
        @mac_and_cheese = Recipe.create(name:'mac and cheese')
        @user= User.create(name:'HungryBoy', 
          email: "feedme@gmail.com", 
          password: "food1234", 
          password_confirmation: "food1234",
          public_profile: true)
      end

    # let(:recipe) {Recipe.new(name: 'mac and cheese')}

      it 'can successfuly find mac and cheese in Recipe database' do
        expect(Search.for(@mac_and_cheese.name, @user)).to eq([@mac_and_cheese])
        binding.pry
      end

      
  end
end