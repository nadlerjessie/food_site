class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :view_count
      t.boolean :public_recipe, default: true
      t.integer :user_id
      t.string :image_url

      t.timestamps null: false
    end
  end
end
