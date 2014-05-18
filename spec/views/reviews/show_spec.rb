require "spec_helper"

describe "reviews/show" do
  subject { page }
  let(:game) { create(:game) }
  let!(:user) { create(:user) }
  let!(:review) { create(:review, game: game, user: user) }

  before do
    visit game_review_path(game, review)
  end

  it "displays link to reviewed game" do
    expect(page).to have_link('farcry 3', game_path(game))
  end

  it "displays review title" do
    expect(page).to have_selector("h3 strong", text: 'Cool stuff')
  end

  it "displays review full text" do
    expect(page).to have_selector("p", text: "I recommend this")
  end

  it "displays author of review" do
    expect(page).to have_selector("p", text: "by jacky")
  end

  it "displays header for comments" do
    expect(page).to have_selector("h4", text: "List of comments")
  end

  it "displays link to edit review" do
    expect(page).to have_link('Edit', edit_game_review_path(game, review))
  end

  it "displays link to go back to reviews list" do
    expect(page).to have_link('Go back', game_reviews_path(game))
  end
end
