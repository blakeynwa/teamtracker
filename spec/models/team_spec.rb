require 'rails_helper'

RSpec.describe Team, type: :model do
  team = Team.new(sport: "softball", number_required_to_play: 5)
  describe "team is instantiated with attributes" do 
    it "has a specific sport" do 
      expect(team.sport).to eq("softball")
    end

    it "has a number of players required to play" do 
      expect(team.number_required_to_play).to eq(5)
    end
  end
end
