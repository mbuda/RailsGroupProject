require "spec_helper"

describe Review do
  subject { 
    Review.create(
      title:"some title", 
      description:"Bla bla blaaa")
  }

  context "#title_capital" do
    it "returns nil when title is empty" do
      expect(Review.new.title_capital).to be_nil
    end

    it "returns the same title if number is first" do
      expect(Review.new(title:"9gag").title_capital).to eq('9gag')
    end

    it "returns first letter capitalized even if other letters are capitalize" do
      expect(Review.new(title:"WHAZZUP").title_capital).to eq('Whazzup')
    end

    it "returns capitalized title" do
      expect(subject.title_capital).to eq('Some title')
    end
  end

  context "#full_description" do
    it "returns nil when description is empty" do
      expect(Review.new.full_description).to be_nil
    end

    it "removes unnecesary whitespace" do
      expect(
      Review.new(
      description:
      " A    long  story it  is").full_description
      ).to eq('A long story it is')
    end

    it "returns full description" do
      expect(subject.full_description).to eq('Bla bla blaaa')
    end
  end

  context "#min_description" do
    it "returns nil if description is empty" do
      expect(Review.new.min_description).to be_nil
    end

    it "removes unnecesary whitespace" do
      expect(Review.new(description:"Aa   is ").min_description).to eq('Aa is')
    end

    it "returns 16 words of description" do
      expect(
      Review.new(
      description:
      "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21").min_description
      ).to eq("1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16")
    end
  end

  context "#nick" do
    it "return nil when user not exists" do
      expect(subject.nick).to be_nil
    end

    it "return nil when user nickname is empty" do
      user = User.new
      subject.user = user
      expect(subject.nick).to be_nil
    end

    it "return user nickname when it is set" do
      user = User.new(nickname:"John",password:"secret")
      subject.user = user
      expect(subject.nick).to eq("John")
    end
  end
end


