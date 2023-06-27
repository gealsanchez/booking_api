require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it 'is invalid without a date' do
    ticket = Ticket.new(date: nil)
    expect(ticket).not_to be_valid
  end

  it 'is not valid without a user_id' do
    ticket = Ticket.new(user_id: nil)
    expect(ticket).not_to be_valid
  end
end