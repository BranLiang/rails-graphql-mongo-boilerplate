require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#Validation' do
    it 'create a new user with valid params' do
      user = create(:user)
      expect(user.name).to eq('姓名')
      expect(user.profile.gender).to eq(1)
    end
  end
end
