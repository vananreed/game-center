require 'rails_helper'

RSpec.describe Playthrough, type: :model do
  let(:tic_tac_toe) { create(:game) }
  let(:minesweeper) { create(:game, name: 'Minesweeper') }
  let(:another_game) { create(:game, name: 'A game') }
  let!(:three_in_row) { create(:achievement) }
  let!(:big_gainer) { create(:achievement, criteria: 2) }
  let!(:explorer) { create(:achievement, criteria: 3) }
  let(:user) { create(:user) }
  let!(:playthrough) { create(:playthrough, user: user, game: tic_tac_toe) }

  it { should belong_to(:user) }
  it { should belong_to(:game) }

  describe '#score' do
    it 'should randomly be set a score between 0 and 1000' do
      expect(playthrough.score.class).to eq Integer
      expect(playthrough.score).to be_between(0, 1000)
    end
  end

  describe '#check_achievements' do
    it 'should create a 3 in a row achievement' do
      user.playthroughs.create!(game: tic_tac_toe)

      expect { user.playthroughs.create!(game: tic_tac_toe) }.to change { user.users_achievements.count }.by 1
      expect(user.users_achievements.last.achievement).to eq three_in_row
    end

    it 'should create an explorer achievement' do
      user.playthroughs.create!(game: another_game)

      expect { user.playthroughs.create!(game: minesweeper) }.to change { user.users_achievements.count }.by 1
      expect(user.users_achievements.last.achievement).to eq explorer
    end
  end
end
