class RecipeSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :name, :view_count, :user_id, :public_recipe, :image_url
  has_many :proportions
  has_many :categories
  has_many :steps
end
