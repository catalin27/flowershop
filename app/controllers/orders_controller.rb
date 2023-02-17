class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # TODO: paginate
    filter_params = Order.states.keys.include?(params[:state]) ? { state: params[:state] } : {}
    @orders = Order.where(filter_params).order(:id)

    respond_to do |format|
      format.html {}
      format.json { render json: @orders }
    end
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.json { render json: @order, status: :created }
      else
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @order = Order.find_by(id: params[:id])

    respond_to do |format|
      if @order&.update(order_params)
        format.json { head :ok }
      else
        response_text = @order.present? ? {errors: @order.errors.full_messages} : "Order #{params[:id]} does not exist"
        format.json { render json: response_text, status: :unprocessable_entity }
      end
    end
  end

  private

  def order_params
    params.permit(:sender_name, :recipient_name, :flowers, :delivery_address, :state)
  end
end