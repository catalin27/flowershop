class OrdersController < ApplicationController
  def index
    # TODO: filter_params
    # TODO: paginate
    @orders = Order.all
  end

  def update
  end
end