require 'spec_helper'

describe Game do
  subject {
	Game.create(
		title:"witty title",
		description:"Fun",
		release_date:"12.05.2004",
		requirements:"High",
		genre:"Shooter",
		PEGI:13,
		producent:"Arc"
		)
		
	}

	context "#title_capital" do
		it "returns nil when title is empty" do
			expect(Game.new.title_capital).to be_nil
		end

		it "returns only first letter capitalized when some others are capitalized"
			expect(Game.new(title: "AmNEsIa").title_capital).to eq('Amnesia')
		end

		it "returns title capitalized" do
			expect(subject.title_capital).to eq('title')
		end

		it "returns the same title if there are numbers in title" do
			expect(Review.new(title:"1more2drinkfor3").title_capital).to eq('1more2drinkfor3')
		end
	end

	context "#full_description" do
		it "returns nil when description is empty" do
			expect(Game.new.full_description).to be_nil
		end

		it "removes too much whitespace between words" do
			expect(
			Game.new(
			description:
			"Those are    some  random    words").full_description
			).to eq('Those are some random words')
		end
		
		it "returns full description" do
			expect(subject.full_description).to eq('la la la')
		end
	end

	context "#min_description" do
		it "returns nil if description is empty" do
      		expect(Review.new.min_description).to be_nil
    	end

    		it "removes unnecesary whitespace" do
      			expect(Game.new(description:"Aa is ").min_description).to eq('Aa is')
    		end

    		it "returns 16 words of description" do
      			expect(
      			Game.new(
      			description:
      			"1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21").min_description
      			).to eq("1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16")
    		end
  	end

 	context "#rel_date" do
    		it "return nil when game not exists" do
      			expect(subject.rel_date).to be_nil
    		end

    		it "return nil when game release date is empty" do
     			game = Game.new
      			subject.game = game
      			expect(subject.rel_date).to be_nil
    		end

    		it "return game release date when it is set" do
      			game = Game.new(title:'A', description:'Test', release_date:'12.05.2006', requirements:'High', genre:'Shooter', PEGI: '13', producent:'Arc' )
      			subject.game = game
      			expect(subject.rel_date).to eq("12.05.2006")
    		end
  	end

        context "#req" do
                it "return nil when game not exists" do
                        expect(subject.req).to be_nil
                end

                it "return nil when game requirements are empty" do
                        game = Game.new
                        subject.game = game
                        expect(subject.req).to be_nil
                end

                it "return game requirements when they are set" do
                        game = Game.new(title:'A', description:'Test', release_date:'12.05.2006', requirements:'High', genre:'Shooter', PEGI:'13', producent:'Arc')
                        subject.game = game
                        expect(subject.req).to eq("High")
                end
        end

        context "#game_genre" do
                it "return nil when game not exists" do
                        expect(subject.game_genre).to be_nil
                end

                it "return nil when game genre is empty" do
                        game = Game.new
                        subject.game = game
                        expect(subject.game_genre).to be_nil
                end

                it "return game genre when it is set" do
                        game = Game.new(title:'A', description:'Test', release_date:'12.05.2006', requirements:'High', genre:'Shooter', PEGI:'13', producent:'Arc')
                        subject.game = game
                        expect(subject.game_genre).to eq("Shooter")
                end
        end

	context "#game_PEGI" do
                it "return nil when game not exists" do
                        expect(subject.game_PEGI).to be_nil
                end

                it "return nil when game PEGI is empty" do
                        game = Game.new
                        subject.game = game
                        expect(subject.game_PEGI).to be_nil
                end

                it "return game PEGI when it is set" do
                        game = Game.new(title:'A', description:'Test', release_date:'12.05.2006', requirements:'High', genre:'Shooter', PEGI:'13', producent:'Arc')
                        subject.game = game
                        expect(subject.game_PEGI).to eq("13")
                end
        end

        context "#game_producent" do
                it "return nil when game not exists" do
                        expect(subject.game_producent).to be_nil
                end

                it "return nil when game producent is empty" do
                        game = Game.new
                        subject.game = game
                        expect(subject.game_producent).to be_nil
                end

                it "return game producent when it is set" do
                        game = Game.new(title:'A', description:'Test', release_date:'12.05.2006', requirements:'High', genre:'Shooter', PEGI:'13', producent:'Arc')
                        subject.game = game
                        expect(subject.game_producent).to eq("Arc")
                end
        end
end
