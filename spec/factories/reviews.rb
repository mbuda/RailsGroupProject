FactoryGirl.define do
  factory :review do
    association :game
    title 'Cool stuff'
    description 'I recommend this'
    created_at '2014-04-29'
  end

  factory :other_review, class: Review do
    association :game
    title 'What a ...'
    description 'This is hell'
  end

  factory :invalid_review, class: Review do
    title nil
    description nil
  end
end

