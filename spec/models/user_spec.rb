require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:tic_tac_toe) { create(:game) }
  let(:minesweeper) { create(:game, name: 'Minesweeper') }
  let!(:playthrough) { create(:playthrough, user: user, game: tic_tac_toe) }
  let!(:playthrough2) { create(:playthrough, user: user, game: tic_tac_toe) }

  describe 'validations' do
    subject { user }

    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe '#total_score' do
    it 'should output total score of playthroughs' do
      expect(user.total_score).to eq(playthrough.score + playthrough2.score)
    end
  end

  describe '#last_three_games_the_same?' do
    let!(:playthrough3) { create(:playthrough, user: user, game: tic_tac_toe) }

    it 'should correctly return true' do
      expect(user.last_three_games_the_same?).to eq true
    end

    it 'should correctly return false' do
      user.playthroughs.create!(game: minesweeper)
      expect(user.last_three_games_the_same?).to eq false
    end
  end

  describe '#total_different_games_played' do
    let!(:playthrough3) { create(:playthrough, user: user, game: minesweeper) }
    it 'should calculate correctly' do
      expect(user.total_different_games_played).to eq 2
    end
  end
end
