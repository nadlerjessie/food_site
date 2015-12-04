require 'pry'
require 'spec_helper'
require 'rails_helper'

RSpec.describe Proportion, type: :model do

  describe 'Proportion associations' do
    let(:proportion) {FactoryGirl.build(:proportion, quantity: quantity)}

      let(:quantity) {100}
      it 'has a quantity' do
        expect(quantity).to eq 100
      end

      let(:ingredient) {FactoryGirl.build(:ingredient)}
      it 'has an ingredient' do
        proportion.ingredient = ingredient
        expect(proportion.ingredient).to eq ingredient
      end

      let(:unit) {FactoryGirl.build(:unit)}
      it 'has a unit' do
        proportion.unit = unit
        expect(proportion.unit).to eq unit
      end

      let(:recipe) {FactoryGirl.build(:recipe)}
      it 'belongs to a recipe' do
        proportion.recipe = recipe
        expect(proportion.recipe).to eq recipe
      end



### VALIDITY TESTS TO COME



  end
end
