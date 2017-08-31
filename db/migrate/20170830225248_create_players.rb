class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :phone_number, null: false, numericality: true, unique: true

      t.timestamps
    end
  end
end
