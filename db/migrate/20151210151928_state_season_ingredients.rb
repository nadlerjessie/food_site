class StateSeasonIngredients < ActiveRecord::Migration
  def change
    create_table :state_season_ingredients do |t|
      t.integer :state_season_id
      t.integer :ingredient_id
      t.timestamps null: false
    end
  end
end
