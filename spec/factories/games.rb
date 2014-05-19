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

  factory :invalid_game do
    title nil
  end
end

