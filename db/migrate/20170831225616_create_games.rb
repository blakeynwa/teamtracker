class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.datetime :date
      t.string :location
      t.string :home_team
      t.string :away_team

      t.timestamps
    end
  end
end
