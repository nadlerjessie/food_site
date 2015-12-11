class RecipeSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :name, :view_count, :user_id, :public_recipe, :image_url, :note
  has_many :proportions
  has_many :categories
  has_many :steps
end
