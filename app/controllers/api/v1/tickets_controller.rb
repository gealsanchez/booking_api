module API
    module V1
      class TicketsController < ApplicationController
        before_action :set_ticket, only: [:show, :destroy]
  
        def index
          @tickets = current_user.tickets
          render json: @tickets
        end
  
        def show
          render json: @ticket
        end
  
        def create
          @ticket = current_user.tickets.build(ticket_params)
          if @ticket.save
            render json: @ticket, status: :created
          else
            render json: @ticket.errors, status: :unprocessable_entity
          end
        end
  
        def destroy
          @ticket.destroy
          head :no_content
        end
  
        private
  
        def set_ticket
          @ticket = Ticket.find(params[:id])
        end
  
        def ticket_params
          params.require(:ticket).permit(:date, :automobile_id)
        end
      end
    end
  end
  