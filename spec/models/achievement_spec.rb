require 'rails_helper'

RSpec.describe Achievement, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:criteria) }

  describe '#criteria_met?' do

  end
end
