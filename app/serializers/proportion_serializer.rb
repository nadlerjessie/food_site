class ProportionSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :unit_id, :ingredient_id, :recipe_id
end
