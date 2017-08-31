class Players < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :phone_number, null: false, numericality: true, unique: true
    end
  end
end
