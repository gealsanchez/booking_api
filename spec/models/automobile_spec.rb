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
end  