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

  it 'is invalid without a year' do
    automobile = Automobile.new(year: nil)
    expect(automobile).not_to be_valid
    expect(automobile.errors[:year]).to include("can't be blank")
  end

  it 'is invalid with a year greater than the current year' do
    automobile = Automobile.new(year: Date.today.year + 1)
    expect(automobile).not_to be_valid
    expect(automobile.errors[:year]).to include("must be less than or equal to #{Date.today.year}")
  end

  it 'is invalid without a rate' do
    automobile = Automobile.new(rate: nil)
    expect(automobile).not_to be_valid
    expect(automobile.errors[:rate]).to include("can't be blank")
  end

  it 'is invalid with a non-positive rate' do
    automobile = Automobile.new(rate: -1000)
    expect(automobile).not_to be_valid
    expect(automobile.errors[:rate]).to include('must be greater than 0')
  end

  it 'is invalid without a location' do
    automobile = Automobile.new(location: nil)
    expect(automobile).not_to be_valid
    expect(automobile.errors[:location]).to include("can't be blank")
  end
end
