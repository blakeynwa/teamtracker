class CreateAvailabilities < ActiveRecord::Migration[5.1]
  def change
    create_table :availabilities do |t|
      t.integer :game_id
      t.integer :player_id
      t.string :can_participate

      t.timestamps
    end
  end
end
