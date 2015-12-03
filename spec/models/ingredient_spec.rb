require 'pry'
require 'spec_helper'
require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'Ingredient' do
    let(:ingredient) {FactoryGirl.build(:ingredient, name: name)}

    let(:name) {'rosemary'}
    it 'has name' do
      expect(name).to eq name
    end

    let(:proportion) {Proportion.new(ingredient_id: ingredient.id)}
    it 'can be associated with a proportion' do
      expect(proportion.ingredient_id).to eq ingredient.id
    end

    let(:proportion1) {Proportion.new(unit_id: ingredient.id)}
    let(:proportion2) {Proportion.new(unit_id: ingredient.id)}
    it 'can be associated with multiple proportions' do
      expect(proportion1.ingredient_id == ingredient.id && proportion2.ingredient_id == ingredient.id).to eq true
      # expect(Proportion.where(unit_id: unit.id).length).to eq 2
    end


  end
end
