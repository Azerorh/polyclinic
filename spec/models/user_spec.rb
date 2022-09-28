require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates phone number' do
    user = build(:user)

    expect(user).to be_valid
  end
end
