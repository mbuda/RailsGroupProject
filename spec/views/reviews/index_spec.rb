require "spec_helper"

describe "reviews/index" do
  subject { page }
  let(:game) { create(:game) }
  let!(:user) { create(:user) }
  let!(:review) { create(:review, game: game, user: user) }
  let!(:other_review) { create(:other_review, game: game) }
  before do
    visit game_reviews_path(game)
  end

  it "contains headline" do
    expect(page).to have_selector('h1', text: 'List of reviews')
  end

  context "reviews table" do
    context "displays in table head" do
      it "'Game' label" do
        expect(page).to have_selector("thead tr th:nth-of-type(1)", text: 'Game')
      end

      it "'Title' label" do
        expect(page).to have_selector("thead tr th:nth-of-type(2)", text: 'Title')
      end

      it "'Description' label" do
        expect(page).to have_selector("thead tr th:nth-of-type(3)", text: 'Description')
      end

      it "'Author' label" do
        expect(page).to have_selector("thead tr th:nth-of-type(4)", text: 'Author')
      end

      it "'Number of comments' label" do
        expect(page).to have_selector("thead tr th:nth-of-type(5)", text: 'Number of comments')
      end
    end

    context "displays in table body" do
      it "all reviews" do
        expect(page).to have_css("tbody tr", count: 2)
      end

      it "title of game" do
        expect(page).to have_selector("tbody tr:nth-of-type(1) td:nth-of-type(1)", text: 'farcry 3')
      end

      it "title of review" do
        expect(page).to have_selector("tbody tr:nth-of-type(1) td:nth-of-type(2)", text: 'Cool stuff')
      end

      it "shorten text of review" do
        expect(page).to have_selector("tbody tr:nth-of-type(1) td:nth-of-type(3)", text: 'I recommend this')
      end

      it "author of reviews" do
        expect(page).to have_selector("tbody tr:nth-of-type(1) td:nth-of-type(4)", text: 'jacky')
      end

      it "number of comments" do
        expect(page).to have_selector("tbody tr:nth-of-type(1) td:nth-of-type(5)", text: '0')
      end
    end
  end
end


