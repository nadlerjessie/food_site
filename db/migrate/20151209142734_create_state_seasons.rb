class CreateStateSeasons < ActiveRecord::Migration
  def change
    create_table :state_seasons do |t|
      t.integer :state_id
      t.integer :season_id

      t.timestamps null: false
    end
  end
end
