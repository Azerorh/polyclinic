require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it 'validates phone number' do
    doctor = build(:doctor)

    expect(doctor).to be_valid
  end
end
