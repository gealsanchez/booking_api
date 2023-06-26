# spec/models/automobile_spec.rb
require 'rails_helper'

RSpec.describe Automobile, type: :model do
  it 'is valid with valid attributes' do
    automobile = Automobile.new(
      model: 'Some Model',
      year: Date.today.year,
      rate: 1000,
      location: 'Some Location'
    )
    expect(automobile).to be_valid
  end

  it 'is invalid without a model' do
    automobile = Automobile.new(model: nil)
    expect(automobile).not_to be_valid
    expect(automobile.errors[:model]).to include("can't be blank")
  end
end  