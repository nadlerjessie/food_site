class CreateIngredientStates < ActiveRecord::Migration
  def change
    create_table :ingredient_states do |t|
      t.integer :state_id
      t.integer :ingredient_id
      t.integer :season_id

      t.timestamps null: false
    end
  end
end
