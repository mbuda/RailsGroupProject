FactoryGirl.define do
  factory :user do
    nickname 'jacky'
    password 's3cr3t'
    description "I'm the boss"
  end

  factory :other_user do
    nickname 'milady'
    password 'butler'
    description 'I like roses'
  end

  factory :invalid_user do
    nickname nil
    password nil
    description nil
  end
end
