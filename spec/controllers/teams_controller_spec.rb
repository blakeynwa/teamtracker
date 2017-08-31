require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  let!(:team) { Team.create!(name: "Seagulls", sport: "Basketball", number_required_to_play: "5") }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "assigns teams as @teams" do 
      get :index
      expect(assigns(:teams)).to eq([team])
    end

    it "renders the index template" do 
      get :index
      expect(response).to render_template(:index)
    end
  end

end
