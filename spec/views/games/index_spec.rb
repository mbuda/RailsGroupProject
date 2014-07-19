require 'spec_helper'

describe 'games/index' do
  subject { page }
  let!(:game) { create(:game) }
  let!(:other_game) { create(:other_game) }
  let!(:user) { create(:user) }
  before do
    visit games_path
  end

  it 'contains headline' do
    expect(page).to have_selector('h1', text: 'List of games')
  end

  context 'games table' do
    context 'displays in table head' do
      it "'Title' label" do
        expect(page).to have_selector('thead tr th:nth-of-type(1)', text: 'Title')
      end

      it "'Number of reviews' label" do
        expect(page).to have_selector('thead tr th:nth-of-type(2)', text: 'Number of reviews')
      end
    end

    context 'displays in table body' do
      it 'all games' do
        expect(page).to have_css('tbody tr', count: 2)
      end
    end
  end
end
