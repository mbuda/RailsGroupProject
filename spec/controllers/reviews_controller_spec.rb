require 'spec_helper'

describe ReviewsController do
  let!(:game) {
    Game.create(
      title:"sengoku basara",
      description: "Slasher with samurais",
      release_date:"2013-09-09",
      requirements:"high",
      genre:"slasher",
      PEGI: "15",
      producent:
      "Capcom")
  }
  let!(:review) {
    Review.create(title:"Samurai banzai", description: "It is awesome", game: game)
  }
  before { request.env['HTTPS'] = 'on' }

  describe 'GET #new' do
    it "assigns new Review to @review" do
      get :new, game_id: game
      expect(assigns(:review)).to be_a_new(Review)
    end

    it "renders the :new template" do
      get :new, game_id: game
      expect(response).to render_template :new
    end
  end
end
