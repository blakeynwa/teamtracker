class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :game_id
      t.integer :team_id

      t.timestamps
    end
  end
end
