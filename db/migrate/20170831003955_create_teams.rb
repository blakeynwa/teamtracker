class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :sport
      t.integer :number_required_to_play

      t.timestamps
    end
  end
end
