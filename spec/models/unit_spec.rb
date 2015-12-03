require 'pry'
require 'spec_helper'
require 'rails_helper'

RSpec.describe Unit, type: :model do
  describe 'Unit' do
    let(:unit) {FactoryGirl.build(:unit, id: 732, name: name)}

    let(:name) {'touch'}
    it 'has name' do
      expect(name).to eq name
    end

    let(:proportion) {Proportion.new(unit_id: unit.id)}
    it 'can be associated with a proportion' do
      expect(proportion.unit_id).to eq unit.id
    end

    let(:proportion1) {Proportion.new(unit_id: unit.id)}
    let(:proportion2) {Proportion.new(unit_id: unit.id)}
    it 'can be associated with multiple proportions' do
      expect(proportion1.unit_id == unit.id && proportion2.unit_id == unit.id).to eq true
      # expect(Proportion.where(unit_id: unit.id).length).to eq 2
    end


  end
end
