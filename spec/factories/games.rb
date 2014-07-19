FactoryGirl.define do
  factory :game do
    title 'farcry 3'
    description 'some text'
    release_date '2014-03-30'
    requirements 'medium'
    genre 'action'
    pegi '16'
    producent 'Ubisoft'
  end

  factory :other_game, class: 'Game' do
    title 'Patapon'
    description 'you need to win'
    release_date '2008-02-22'
    requirements 'low'
    genre 'rhytm game'
    pegi '7'
    producent 'Japan Studio'
  end

  factory :invalid_game do
    title nil
  end
end

