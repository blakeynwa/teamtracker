class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false, unique: true
      t.integer :team_id

      t.timestamps
    end
  end
end
