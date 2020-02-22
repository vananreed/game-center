FactoryBot.define do
  factory :user do
    username { 'Player1' }
    password  { 'sikre4341' }
  end

  factory :game do
    name { "Tic-tac-toe"}
  end

  factory :playthrough do
    association :user
    association :game, factory: :game
  end

  factory :achievement do
    name { '3 in a row' }
    criteria { 1 }
  end
end
