class Api::V1::TicketsController < ApplicationController
  def index
    @user = User.includes(tickets: { automobile: :image_attachment }).find(params[:user_id])
    @tickets = @user.tickets
    render json: @tickets.(include: { automobile: { methods: :image_url } })
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)
    @user = User.find(params[:user_id])
    @ticket.user = @user
    if @ticket.save
      render json: @ticket, status: :created
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end
  # Only allow a list of trusted parameters through.
  def ticket_params
    params.require(:ticket).permit(:automobile_id, :user_id)
  end
end