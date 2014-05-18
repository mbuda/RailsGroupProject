require "spec_helper"

describe "reviews/edit.html.erb" do
  let!(:game) { create(:game) }
  let!(:review) { create(:review, game: game) }
  before do
    visit edit_game_review_path(game, review)
  end

  it "displays label 'Game'" do
    expect(page).to have_selector("div.col-xs-4", text: 'Game')
  end

  it "displays label 'Title'" do
    expect(page).to have_selector("div.col-xs-4", text: 'Title')
  end

  it "displays label 'Description'" do
    expect(page).to have_selector("div.col-xs-4", text: 'Description')
  end
end
