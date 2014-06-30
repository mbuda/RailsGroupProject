require 'spec_helper'

describe Game do
  subject {
    Game.create(
      title:'witty title',
      description:' la1 la2 la3  la4 la5 la6 la7 la8 la9 la10   la11 la12  la13 la14 la15 la16 la17',
      release_date:'05-12-2004',
      requirements:'High',
      genre:'Shooter',
      pegi:'13',
      producent:'Arc'
  )

  }

  context '#game_title' do
    it 'returns nil when title is empty' do
      game = Game.new
      expect(game.game_title).to be_nil
    end
  end

  context '#full_description' do
    it 'returns nil when description is empty' do
      game = Game.new
      expect(game.full_description).to be_nil
    end

    it 'removes too much whitespace between words' do
      expect(subject.full_description).
        to eq('la1 la2 la3 la4 la5 la6 la7 la8 la9 la10 la11 la12 la13 la14 la15 la16 la17')
    end

    it 'returns full description' do
      expect(subject.full_description).
        to eq('la1 la2 la3 la4 la5 la6 la7 la8 la9 la10 la11 la12 la13 la14 la15 la16 la17')
    end
  end

  context '#min_description' do
    it 'returns nil if description is empty' do
      game = Game.new
      expect(game.min_description).to be_nil
    end

    it 'removes unnecesary whitespace' do
      expect(subject.min_description).to eq('la1 la2 la3 la4 la5 la6 la7 la8 la9 la10 la11 la12 la13 la14 la15 la16')
    end

    it 'returns 16 words of description' do
      expect(subject.min_description).
        to eq('la1 la2 la3 la4 la5 la6 la7 la8 la9 la10 la11 la12 la13 la14 la15 la16')
    end
  end

  context '#rel_date' do
    it 'return nil when game release date is empty' do
      game = Game.new
      expect(game.rel_date).to be_nil
    end
  end

  context '#req' do
    it 'return nil when game requirements are empty' do
      game = Game.new
      expect(game.req).to be_nil
    end

    it 'return game requirements when they are set' do
      expect(subject.req).to eq('High')
    end
  end

  context '#game_genre' do
    it 'return nil when game genre is empty' do
      game = Game.new
      expect(game.game_genre).to be_nil
    end

    it 'return game genre when it is set' do
      expect(subject.game_genre).to eq('Shooter')
    end
  end

  context '#game_producent' do
    it 'return nil when game not exists' do
      game = Game.new
      expect(game.game_producent).to be_nil
    end

    it 'return nil when game producent is empty' do
      game = Game.new
      expect(game.game_producent).to be_nil
    end

    it 'return game producent when it is set' do
      expect(subject.game_producent).to eq('Arc')
    end
  end
end
