require 'pry'
require 'spec_helper'
require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category' do
    before do
      @tex_mex = Category.create(name: "Tex-Mex")
      @burrito = Recipe.create(name:"burrito")
      @fajitas = Recipe.create(name:"fajitas")
      binding.pry
      @burrito.category_id = @tex_mex.id
      @fajitas.category_id = @tex_mex.id
    end

    it 'can belong to a recipe' do
      expect(@burrito.category_id).to eq @tex_mex.id
    end

    it 'can belong to many recipes' do
      expect(@burrito.category_id && @fajitas.category_id).to eq @tex_mex.id
    end

  end
end
